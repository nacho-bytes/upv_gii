(deffacts bh (pila A B A A B B A pilaA pilaB))
(defrule mover-a-pila-A
          (pila $?x A $?y pilaA   $?z) =>
  (assert (pila $?x   $?y pilaA A $?z)))
(defrule mover-a-pila-B
          (pila $?x B $?y pilaA $?z pilaB   $?zz) =>
  (assert (pila $?x   $?y pilaA $?z pilaB B $?zz)))
(defrule obj
          (pila pilaA $?z pilaB $?zz) =>
  (printout T "¡Solución encontrada!" crlf) (halt))
(set-strategy depth)
(watch facts)
(watch activations)
(reset)
(run)
(exit)
