(deffacts datos
	(robot 1 2)
	(obstaculo 3 2)
	(obstaculo 2 2)
	(mapa 4 3)
	(meta 4 2)
)

(defrule derecha
	(robot ?x ?y)
	(mapa ?z ?)
	(test (< ?x ?z))
	(not (obstaculo =(+ ?x 1) ?y))
  =>
	(assert (robot (+ ?x 1) ?y))
)

(defrule arriba
	(robot ?x ?y)
	(mapa ? ?z)
	(test (< ?y ?z))
	(not (obstaculo ?x =(+ ?y 1)))
  =>
	(assert (robot ?x (+ ?y 1)))
)

(defrule izquierda
	(robot ?x ?y)
	(test (> ?x 1))
	(not (obstaculo =(- ?x 1) ?y))
  =>
	(assert (robot (- ?x 1) ?y))
)

(defrule abajo
	(robot ?x ?y)
	(mapa ?z ?)
	(test (> ?y 1))
	(not (obstaculo ?x =(- ?y 1)))
  =>
	(assert (robot  ?x (- ?y 1)))
)

(defrule parar
	(declare (salience 10))
	(robot ?x ?y)
	(meta ?x ?y)
  =>
	(halt)
	(printout t "Meta alcanzada" crlf)
)