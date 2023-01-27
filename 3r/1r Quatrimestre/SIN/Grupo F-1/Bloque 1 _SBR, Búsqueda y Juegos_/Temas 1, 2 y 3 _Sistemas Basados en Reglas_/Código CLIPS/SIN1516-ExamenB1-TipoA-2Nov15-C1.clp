(deffacts bh (lista a b a b a))
(defrule R1
  ?f <- (lista ?x $?y ?x $?z) =>
;  (retract ?f)
  (assert (lista $?y ?x $?z))
  (printout t "La lista se ha modificado" crlf))
;(set-strategy breadth)
;(watch facts)
;(watch activations)
;(reset)
;(run)
;(exit)
