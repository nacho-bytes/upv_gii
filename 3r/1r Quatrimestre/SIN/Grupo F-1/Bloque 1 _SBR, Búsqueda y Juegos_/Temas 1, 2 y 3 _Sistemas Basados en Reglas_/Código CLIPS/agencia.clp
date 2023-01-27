(deffacts bhinicio (agencia almacen A destino B 4 destino C 3 
  almacen B destino A 7 destino C 3 
  almacen C destino A 3 destino B 3 camion A total 0))

(defrule cargar
  (agencia $?x almacen ?alm destino ?dest ?num $?y camion ?alm $?z 
   total ?total)
  (test (not (member$ ?dest $?z)))
  (test (<= (+ ?total ?num) 10)) =>
  (assert (agencia $?x almacen ?alm $?y camion ?alm destino ?dest 
   ?num $?z total (+ ?total ?num))))

(defrule descargar
  (agencia $?x camion ?loc $?y destino ?loc ?num $?z total ?tot) =>
  (assert (agencia $?x camion ?loc $?y $?z total (- ?tot ?num))))

(defrule mover
  (agencia $?x almacen ?alm $?y camion ?loc $?z) =>
  (assert (agencia $?x almacen ?alm $?y camion ?alm $?z)))

(defrule parar
  (agencia almacen A almacen B almacen C camion ? total 0) =>
  (printout t "PAQUETES ENTREGADOS!" crlf)
  (halt))
