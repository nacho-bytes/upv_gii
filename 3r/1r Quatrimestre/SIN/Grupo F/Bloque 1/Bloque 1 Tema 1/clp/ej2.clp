(deffacts bf
  (lista 1 2 3 4))

(defrule R1
?f <- (lista ?x $?z)
=>
(retract ?f)
(assert (lista ?z))
(assert (elemento ?x)))

(defrule R2
?f <- (elemento ?x)
(elemento ?y)
(test (< ?x ?y))
=>
(retract ?f)
(assert (lista-new ?x ?y)))
