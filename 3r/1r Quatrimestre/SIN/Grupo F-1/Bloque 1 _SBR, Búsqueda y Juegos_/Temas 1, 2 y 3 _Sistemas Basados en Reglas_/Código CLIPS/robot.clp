(deffacts bhrobot (grid 3 3) (obs 2 2) (meta 3 3) (robot 1 1))
(defrule derecha
  (robot ?x ?y)
  (obs ?ox ?oy)
  (grid ?gx ?gy)
  (test (< ?x ?gx))
  (test (not (and (eq (+ ?x 1) ?ox) (eq ?y ?oy))))  
  =>
  (assert (robot (+ ?x 1) ?y)))
(defrule arriba
  (robot ?x ?y)
  (obs ?ox ?oy)
  (grid ?gx ?gy)
  (test (< ?y ?gy))
  (test (not (and (eq ?x ?ox) (eq (+ ?y 1) ?oy))))  
  =>
  (assert (robot ?x (+ ?y 1))))
(defrule izquierda
  (robot ?x ?y)
  (obs ?ox ?oy)
  (test (> ?x 1))
  (test (not (and (eq (- ?x 1) ?ox) (eq ?y ?oy))))
  =>
  (assert (robot (- ?x 1) ?y)))

(defrule abajo
  (robot ?x ?y)
  (obs ?ox ?oy)
  (test (> ?y 1))
  (test (not (and (eq ?x ?ox) (eq (- ?y 1) ?oy))))      
  =>
  (assert (robot ?x (- ?y 1)))
)

(defrule meta
  (declare (salience 10)) 
  (robot ?x ?y)
  (meta ?x ?y)
  =>
  (printout t "META ALCANZADA!" crlf)
  (halt)
)
;(set-strategy breadth)
;(watch facts)
;(watch activations)
;(reset)
;(run)
;(exit)
