(deffacts bf
  (pendent Manel Nora Laia))

(defrule saluda
  ?f <- (pendent ?x $?y)
  =>
  (printout t "Hola " ?x crlf)
  (retract ?f)
  (assert (pendent $?y)))

(defrule acaba
  (pendent)
  =>
  (halt))
