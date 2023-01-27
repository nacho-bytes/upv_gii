(deffacts datos (lista 4 5 3 46 12 10))
(defrule ordenar
  ?f <- (lista $?x ?y ?z $?w)
  (test (< ?z ?y))
  => 
  (retract ?f)
  (assert (lista $?x ?z ?y $?w)))
(set-strategy breadth)
(watch facts)
(watch activations)
(reset)
(run)
(exit)
