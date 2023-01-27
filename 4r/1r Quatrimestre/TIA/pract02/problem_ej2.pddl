; Práctica 2 - Planificación
; Autor: Iñaki Diez Lambies
(define (problem original) 
  (:domain autonomous-taxi)
  (:objects
    ; Taxis
    taxi1 -taxi
    taxi2 -taxi
    taxi3 -taxi
    taxi4 -taxi
    taxi5 -taxi

    ; Pasajeros
    pass1 -passenger
    pass2 -passenger
    pass3 -passenger
    pass4 -passenger
    pass5 -passenger
    pass6 -passenger
    pass7 -passenger

    ; Sitios
    A -place
    B -place
    C -place
    D -place
    E -place
    F -place
    G -place
  )

  (:init
    ; Taxis
    (= (max-pending-trans) 2)

    (at taxi1 A)
    (= (pending-trans taxi1) 0)
    (= (autono-taxi taxi1) 5)

    (at taxi2 A)
    (= (pending-trans taxi2) 0)
    (= (autono-taxi taxi2) 10)

    (at taxi3 C)
    (= (pending-trans taxi3) 1)
    (= (autono-taxi taxi3) 20)

    (at taxi4 B)
    (= (pending-trans taxi4) 1)
    (= (autono-taxi taxi4) 40)

    (at taxi5 D)
    (= (pending-trans taxi5) 1)
    (= (autono-taxi taxi5) 2)

    ; Pasajeros
    (= (load-pass-time) 1)
    (= (unload-pass-time) 1)

    (at pass1 A)
    (at pass2 B)
    (at pass3 F)
    (at pass4 D)
    (at pass5 E)
    (at pass6 A)
    (at pass7 G)

    ; Billetes
    (= (beneficio-empresa) 0)
    (= (billetes-rest pass1) 0)
    (= (billetes-rest pass2) 0)
    (= (billetes-rest pass3) 0)
    (= (billetes-rest pass4) 0)
    (= (billetes-rest pass5) 0)
    (= (billetes-rest pass6) 0)
    (= (billetes-rest pass7) 0)
    (maquin-expen A)
    (maquin-expen B)
    (maquin-expen C)
    (= (pack-billetes) 5)
    (= (pack-duracion) 1)
    (= (pack-beneficio) 4)
    (= (rec-taxi-billetes) 1)
    (= (rec-taxi-duracion) 1)
    (= (rec-taxi-beneficio) 1)

    ; Sitios
    (= (distance A A) 0)
    (= (distance A B) 8)
    (= (distance A C) 12)
    (= (distance A D) 20)
    (= (distance A E) 60)
    (= (distance A F) 80)
    (= (distance A G) 120)

    (= (distance B A) 8)
    (= (distance B B) 0)
    (= (distance B C) 4)
    (= (distance B D) 16)
    (= (distance B E) 24)
    (= (distance B F) 48)
    (= (distance B G) 120)

    (= (distance C A) 12)
    (= (distance C B) 4)
    (= (distance C C) 0)
    (= (distance C D) 28)
    (= (distance C E) 56)
    (= (distance C F) 32)
    (= (distance C G) 120)

    (= (distance D A) 20)
    (= (distance D B) 16)
    (= (distance D C) 28)
    (= (distance D D) 0)
    (= (distance D E) 32)
    (= (distance D F) 20)
    (= (distance D G) 120)

    (= (distance E A) 60)
    (= (distance E B) 24)
    (= (distance E C) 56)
    (= (distance E D) 32)
    (= (distance E E) 0)
    (= (distance E F) 100)
    (= (distance E G) 120)

    (= (distance F A) 80)
    (= (distance F B) 48)
    (= (distance F C) 32)
    (= (distance F D) 20)
    (= (distance F E) 100)
    (= (distance F F) 0)
    (= (distance F G) 120)

    (= (distance G A) 140)
    (= (distance G B) 140)
    (= (distance G C) 140)
    (= (distance G D) 140)
    (= (distance G E) 140)
    (= (distance G F) 140)
    (= (distance G G) 0)

    ; Revisión
    (aval-revision-place A)
    (aval-revision-place C)
    (aval-revision-place E)
    (= (revision-time) 2)

    ; Carga
    (aval-fast-charge-place A)
    (aval-fast-charge-place B)
    (aval-fast-charge-place C)
    (aval-fast-charge-place G)
    (= (fast-charge-cost) 5)
    (= (fast-charge-time) 4)
    (= (fast-charge-km) 50)

    (aval-slow-charge-place A)
    (aval-slow-charge-place D)
    (aval-slow-charge-place F)
    (aval-slow-charge-place G)
    (= (slow-charge-cost) 8)
    (= (slow-charge-time) 8)
    (= (slow-charge-km) 100)

    ; Costes
    (= (charges-cost) 0)
  )

  (:goal (and
      (at pass1 F)
      (at pass2 E)
      (at pass3 D)
      (at pass4 E)
      (at pass5 A)
      (at pass6 G)
      (at pass7 C)
  ))

  (:metric minimize (- (+ (* 0.3 (total-time)) (* 0.7 (charges-cost))) (beneficio-empresa)))
)
