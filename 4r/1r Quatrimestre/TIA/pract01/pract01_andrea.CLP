    ;Práctica 1. Iñaki Diez Lambies

;CLASE LAVADO (inputs i outputs)

(deftemplate lavado
	(slot peso-crisp (type FLOAT))
	(slot suciedad-crisp (type FLOAT))
	(slot mom-tiempo-lavado-crisp (type FLOAT))
	(slot max-tiempo-lavado-crisp (type FLOAT))
	(slot mom-cantidad-crisp (type FLOAT))
	(slot max-cantidad-crisp (type FLOAT))
)

;VARIABLES DIFUSAS

;Sensor peso
(deftemplate peso			;Variable difusa
	1 10 kg				;Universo
	((bajo (3 1)(4 0))		;Valores difusos
	(medio (3 0)(4 1)(7 1)(9 0))
	(alto (8 0)(9 1))))

;Sensor suciedad
(deftemplate suciedad			;Variable difusa
	50 500 NTU			;Universo
	((limpio (150 1)(200 0))	;Valores difusos
	(normal (150 0)(200 1)(300 1)(450 0))
	(sucio (350 0)(450 1))))

;tiempo lavado
(deftemplate tiempo-lavado			;Variable difusa
	20 120 min			;Universo
	((corto (30 1)(40 0))	;Valores difusos
	(medio (30 0)(50 1)(70 1)(80 0))
	(largo (70 0)(80 1)(90 1)(100 0))
	(extralargo (90 0)(100 1))))

;Cantidad
(deftemplate cantidad			;Variable difusa
	20 100 kg			;Universo
	((minima (30 1)(40 0))		;Valores difusos
	(estandar (30 0)(50 1)(70 1)(80 0))
	(maxima (60 0)(80 1))))

;REGLAS

;TIEMPO DE LAVADO (PESO VS SUCIEDAD)

(defrule tiempo-bajo-limpio
	(peso bajo)
	(suciedad limpio)
	=>(assert (tiempo-lavado extremely corto)))

(defrule tiempo-medio-limpio
	(peso medio)
	(suciedad limpio)
	=>(assert (tiempo-lavado very corto)))

(defrule tiempo-alto-limpio
	(peso alto)
	(suciedad limpio)
	=>(assert (tiempo-lavado corto)))

(defrule tiempo-bajo-normal
	(peso bajo)
	(suciedad normal)
	=>(assert (tiempo-lavado corto)))

(defrule tiempo-medio-normal
	(peso medio)
	(suciedad normal)
	=>(assert (tiempo-lavado medio)))

(defrule tiempo-alto-normal
	(peso alto)
	(suciedad normal)
	=>(assert (tiempo-lavado somewhat largo)))

(defrule tiempo-bajo-sucio
	(peso bajo)
	(suciedad sucio)
	=>(assert (tiempo-lavado largo)))

(defrule tiempo-bajo-sucio
	(peso bajo)
	(suciedad sucio)
	=>(assert (tiempo-lavado largo)))

(defrule tiempo-medio-sucio
	(peso medio)
	(suciedad sucio)
	=>(assert (tiempo-lavado very largo)))

(defrule tiempo-alto-sucio
	(peso alto)
	(suciedad sucio)
	=>(assert (tiempo-lavado extralargo)))

;CANTIDAD DETERGENTE (PESO VS SUCIEDAD)

(defrule tiempo-bajo-limpio
	(peso bajo)
	(suciedad limpio)
	=>(assert (cantidad minima)))

(defrule tiempo-medio-limpio
	(peso medio)
	(suciedad limpio)
	=>(assert (cantidad minima)))

(defrule tiempo-alto-limpio
	(peso alto)
	(suciedad limpio)
	=>(assert (cantidad more-or-less estandar)))

(defrule tiempo-bajo-normal
	(peso bajo)
	(suciedad normal)
	=>(assert (cantidad somewhat estandar)))

(defrule tiempo-medio-normal
	(peso medio)
	(suciedad normal)
	=>(assert (cantidad very estandar)))

(defrule tiempo-alto-normal
	(peso alto)
	(suciedad normal)
	=>(assert (cantidad estandar)))

(defrule tiempo-bajo-sucio
	(peso bajo)
	(suciedad sucio)
	=>(assert (cantidad estandar)))

(defrule tiempo-medio-sucio
	(peso medio)
	(suciedad sucio)
	=>(assert (cantidad maxima)))

(defrule tiempo-alto-sucio
	(peso alto)
	(suciedad sucio)
	=>(assert (cantidad very maxima)))

;FUSIFICAR
(deffunction fuzzify (?fztemplate ?value ?delta)

        (bind ?low (get-u-from ?fztemplate))
        (bind ?hi  (get-u-to   ?fztemplate))

        (if (<= ?value ?low)
          then
            (assert-string
              (format nil "(%s (%g 1.0) (%g 0.0))" ?fztemplate ?low ?delta))
          else
            (if (>= ?value ?hi)
              then
                (assert-string
                   (format nil "(%s (%g 0.0) (%g 1.0))"
                               ?fztemplate (- ?hi ?delta) ?hi))
              else
                (assert-string
                   (format nil "(%s (%g 0.0) (%g 1.0) (%g 0.0))"
                               ?fztemplate (max ?low (- ?value ?delta))
                               ?value (min ?hi (+ ?value ?delta)) ))
            )
        )
  )


;PEDIR POR TECLADO inputs y fusificarlos
(defrule leerconsola
	(initial-fact)
=>
(printout t"Introduzca la cantidad de ropa a lavar (en kg)" crlf)
(bind ?Rpeso (read))
(fuzzify peso ?Rpeso 0)

(printout t"Introduzca el grado de suciedad de la ropa (en NTU)" crlf)
(bind ?Rsuciedad (read))
(fuzzify suciedad ?Rsuciedad 0)
)

;DEFUSIFICAR
(defrule defusificar
	(declare (salience -1))
	(tiempo-lavado ?tlav)
	(cantidad ?cant)
=>
(assert (crisp max-tiempo-lavado-crisp (maximum-defuzzify ?tlav)))
(assert (crisp mom-tiempo-lavado-crisp (moment-defuzzify ?tlav)))
(assert (crisp max-cantidad-crisp (maximum-defuzzify ?cant)))
(assert (crisp mom-cantidad-crisp (moment-defuzzify ?cant)))

(printout t"Tiempo de lavado por momentum " (moment-defuzzify ?tlav) crlf)
(printout t"Tiempo de lavado por maximum " (maximum-defuzzify ?tlav) crlf)

(printout t"Cantidad por momentum " (moment-defuzzify ?cant) crlf)
(printout t"Cantidad por maximum " (maximum-defuzzify ?cant) crlf)

)



