(deffacts bh (cap X 4) (cap Y 3) (agua X 0 Y 0))
(defrule llenarX (cap X ?capX) (agua X ?x Y ?y)
  (test (< ?x ?capX)) => (assert (agua X ?capX Y ?y)))
(defrule llenarY (cap Y ?capY) (agua X ?x Y ?y)
  (test (< ?y ?capY)) => (assert (agua X ?x Y ?capY)))
(defrule vaciarX (agua X ?x Y ?y)
  (test (> ?x 0)) => (assert (agua X 0 Y ?y)))
(defrule vaciarY (agua X ?x Y ?y)
  (test (> ?y 0)) => (assert (agua X ?x Y 0)))
(defrule llenarXdesdeY
  (cap X ?capX) (agua X ?x Y ?y)
  (test (> ?y 0)) (test (< ?x ?capX))
  (test (>= (+ ?x ?y) ?capX)) =>
  (assert (agua X ?capX Y (- ?y (- ?capX ?x)))))
(defrule llenarYdesdeX
  (cap Y ?capY) (agua X ?x Y ?y)
  (test (> ?x 0)) (test (< ?y ?capY))
  (test (>= (+ ?x ?y) ?capY)) =>
  (assert (agua X (- ?x (- ?capY ?y)) Y ?capY)))
(defrule vaciarXenY
  (cap Y ?capY) (agua X ?x Y ?y)
  (test (> ?x 0)) (test (<= (+ ?x ?y) ?capY)) =>
  (assert (agua X 0 Y (+ ?x ?y))))
(defrule vaciarYenX
  (cap X ?capX) (agua X ?x Y ?y)
  (test (> ?y 0)) (test (<= (+ ?x ?y) ?capX)) =>
  (assert (agua X (+ ?x ?y) Y 0)))
(defrule obj
  (agua X 2 Y ?) => (printout t "¡Solución encontrada!" crlf) (halt))
(set-strategy breadth)
(watch facts)
(watch activations)
(reset)
(run)
(exit)
