; Práctica 2 - Planificación
; Autor: Iñaki Diez Lambies
(define (domain autonomous-taxi)

  (:requirements :strips :fluents :typing)

  (:types taxi passenger place -object)

  (:predicates
    (at ?x -(either passenger taxi) ?p -place)
    (in ?p -passenger ?t -taxi)
    (aval-revision-place ?p -place)
    (aval-fast-charge-place ?p -place)
    (aval-slow-charge-place ?p -place)
  )


  (:functions
    ; Taxi
    (max-pending-trans)
    (pending-trans ?t -taxi)
    (autono-taxi ?t -taxi)

    ; Pasajero
    (load-pass-time)
    (unload-pass-time)

    ; Sitios
    (distance ?p1 -place ?p2 -place)

    ; Revisión
    (revision-time)

    ; Carga
    (fast-charge-cost)
    (fast-charge-time)
    (fast-charge-km)
    (slow-charge-cost)
    (slow-charge-time)
    (slow-charge-km)

    ; Costes
    (charges-cost)
  )

  (:durative-action load-pass
      :parameters (?p -passenger ?t -taxi ?pl -place)
      :duration (= ?duration (load-pass-time))
      :condition (and
          (at start 
            (> (pending-trans ?t) 0))
          (at start
            (at ?p ?pl))
          (at start
            (at ?t ?pl))
          ; Otro pasajero no está en el taxi
          (at start 
            (not (exists (?op -passenger)
              (in ?op ?t))))
          (over all
            (at ?t ?pl))
      )
      :effect (and 
          (at start
            (not (at ?p ?pl)))
          (at end
            (in ?p ?t))
      )
  )

  (:durative-action unload-pass
      :parameters (?p -passenger ?t -taxi ?pl -place)
      :duration (= ?duration (unload-pass-time))
      :condition (and 
          (at start
            (at ?t ?pl))
          (at start
            (in ?p ?t))
          (over all
            (at ?t ?pl))
      )
      :effect (and
          (at start
            (not (in ?p ?t)))
          (at end
            (at ?p ?pl))
          (at end
            (decrease (pending-trans ?t) 1))
      )
  )
  
  (:durative-action move-taxi
      :parameters (?t -taxi ?p1 -place ?p2 -place)
      :duration (= ?duration (/ (distance ?p1 ?p2) 4))
      :condition (and
          (at start
            (not (= ?p1 ?p2)))
          (at start
            (>= (autono-taxi ?t) (distance ?p1 ?p2)))
          (at start
            (at ?t ?p1))
          )
      :effect (and 
          (at start
            (not (at ?t ?p1)))
          (at end
            (at ?t ?p2))
          (at end
            (decrease (autono-taxi ?t) (distance ?p1 ?p2)))
      )
  )

  (:durative-action fast-charge-bat
      :parameters (?t -taxi ?p -place)
      :duration (= ?duration (fast-charge-time))
      :condition (and 
          (at start
            (at ?t ?p))
          (at start
            (aval-fast-charge-place ?p))
          (over all
            (at ?t ?p))
      )
      :effect (and 
          (at start
            (not (aval-fast-charge-place ?p)))
          (at end
            (aval-fast-charge-place ?p))
          (at end
            (increase (charges-cost) (fast-charge-cost)))
          (at end
            (increase (autono-taxi ?t) (fast-charge-km)))
      )
  )
  
  (:durative-action slow-charge-bat
      :parameters (?t -taxi ?p -place)
      :duration (= ?duration (slow-charge-time))
      :condition (and 
          (at start
            (at ?t ?p))
          (at start
            (aval-slow-charge-place ?p))
          (over all
            (at ?t ?p))
      )
      :effect (and 
          (at start
            (not (aval-slow-charge-place ?p)))
          (at end
            (aval-slow-charge-place ?p))
          (at end
            (increase (charges-cost) (slow-charge-cost)))
          (at end
            (increase (autono-taxi ?t) (slow-charge-km)))
      )
  )
  
  (:durative-action revise-taxi
      :parameters (?t -taxi ?p -place)
      :duration (= ?duration (revision-time))
      :condition (and 
          (at start
            (<= (pending-trans ?t) (- (max-pending-trans) 1)))
          (at start
            (at ?t ?p))
          (at start
            (aval-revision-place ?p))
          (over all
            (at ?t ?p))
      )
      :effect (and 
          (at start
            (not (aval-revision-place ?p)))
          (at end
            (aval-revision-place ?p))
          (at end
            (assign (pending-trans ?t) (max-pending-trans)))
      )
  )
  
)