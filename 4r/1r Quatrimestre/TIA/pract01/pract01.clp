; Práctica 1. Lógica difusa

; ///////////////////////////////
; DEFINICIÓN DE VARIABLES DIFUSAS
; ///////////////////////////////

(deftemplate peso 		; Nombre
	1 10 kg			; Universo
	(			; Valores
	(bajo (3 1) (4 0))
	(medio (3 0) (4 1) (7 1) (9 0))
	(alto (8 0) (9 1))
	)
)

(deftemplate suciedad
	50 500 NTU
	(
	(limpio (150 1) (200 0))
	(normal (150 0) (200 1) (300 1) (450 0))
	(sucio (350 0) (450 1))
	)
)

(deftemplate tiempo-lavado
	20 120 min
	(
	(corto (30 1) (40 0))
	(medio (30 0) (50 1) (70 1) (80 0))
	(largo (70 0) (80 1) (90 1) (100 0))
	(extralargo (90 0) (100 1))
	)
)

(deftemplate cantidad
	20 100 g
	(
	(minima (30 1) (40 0))
	(estandar (30 0) (50 1) (70 1) (80 0))
	(maxima (60 0) (80 1))
	)
)

; ///////////////////////////////
; DEFINICIÓN DE REGLAS
; ///////////////////////////////

; Tiempo lavado
(defrule tiempo-bajo-limpio				; Nombre
	(peso bajo)					; Condiciones
	(suciedad limpio)
	=> (assert (tiempo-lavado extremely corto))	; Parte derecha
)

(defrule tiempo-medio-limpio
	(peso medio)
	(suciedad limpio)
	=> (assert (tiempo-lavado very corto))
)

(defrule tiempo-alto-limpio
	(peso alto)
	(suciedad limpio)
	=> (assert (tiempo-lavado corto))
)

(defrule tiempo-bajo-normal
	(peso bajo)
	(suciedad normal)
	=> (assert (tiempo-lavado corto))
)

(defrule tiempo-medio-normal
	(peso medio)
	(suciedad normal)
	=> (assert (tiempo-lavado medio))
)

(defrule tiempo-alto-normal
	(peso alto)
	(suciedad normal)
	=> (assert (tiempo-lavado somewhat largo))
)

(defrule tiempo-bajo-sucio
	(peso bajo)
	(suciedad sucio)
	=> (assert (tiempo-lavado largo))
)

(defrule tiempo-medio-sucio
	(peso medio)
	(suciedad sucio)
	=> (assert (tiempo-lavado very largo))
)

(defrule tiempo-alto-sucio
	(peso alto)
	(suciedad sucio)
	=> (assert (tiempo-lavado extralargo))
)

; Cantidad detergente
(defrule cantidad-bajo-limpio
	(peso bajo)
	(suciedad limpio)
	=> (assert (cantidad minima))
)

(defrule cantidad-medio-limpio
	(peso medio)
	(suciedad limpio)
	=> (assert (cantidad minima))
)

(defrule cantidad-alto-limpio
	(peso alto)
	(suciedad limpio)
	=> (assert (cantidad more-or-less estandar))
)

(defrule cantidad-bajo-normal
	(peso bajo)
	(suciedad normal)
	=> (assert (cantidad somewhat estandar))
)

(defrule cantidad-medio-normal
	(peso medio)
	(suciedad normal)
	=> (assert (cantidad very estandar))
)

(defrule cantidad-alto-normal
	(peso alto)
	(suciedad normal)
	=> (assert (cantidad estandar))
)

(defrule cantidad-bajo-sucio
	(peso bajo)
	(suciedad sucio)
	=> (assert (cantidad estandar))
)

(defrule cantidad-medio-sucio
	(peso medio)
	(suciedad sucio)
	=> (assert (cantidad maxima))
)

(defrule cantidad-alto-sucio
	(peso alto)
	(suciedad sucio)
	=> (assert (cantidad very maxima))
)

; Fusificación
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

; Defusificación
(defrule defusificar
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

; Input
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