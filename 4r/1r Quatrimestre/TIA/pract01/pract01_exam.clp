; Práctica 1. Lógica difusa - Examen

; ////////////////////////////////
; DEFINICIÓN DE HECHO ESTRUCTURADO
; ////////////////////////////////

(deftemplate lavado
	(slot peso-crisp (type FLOAT))
	(slot suciedad-crisp (type FLOAT))
	(slot mom-tiempo-lavado-crisp (type FLOAT))
	(slot max-tiempo-lavado-crisp (type FLOAT))
	(slot mom-cantidad-crisp (type FLOAT))
	(slot max-cantidad-crisp (type FLOAT))
	
	(slot grado-crisp (type FLOAT))
	(slot eco (type SYMBOL))
)

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

(deftemplate temperatura
	20 90 C
	(
	(baja (30 1) (40 0))
	(media (pi 25 50))
	(alta (60 0) (80 1))
	)
)

(deftemplate grado
	0 100 %
	(
	(bajo (z 15 30))
	(medio (pi 30 50))
	(alto (s 65 90))
	)
)

; ///////////////////////////////
; DEFINICIÓN DE REGLAS
; ///////////////////////////////

; Modo eco
(defrule temperatura-eco
	(declare (salience 1000))
	?t <- (temperatura ?temp)
	?f <- (lavado (eco ?eco))
	(test (eq ?eco on))
	=>
	(retract ?t)
	(assert (temperatura baja))
	(modify ?f (eco off))
)

; Temperatura-grado
(defrule temperatura-bajo
	(grado bajo)
	=> (assert (temperatura alta))
)

(defrule temperatura-medio
	(grado medio)
	=> (assert (temperatura more-or-less media))
)

(defrule temperatura-alto
	(grado alto)
	=> (assert (temperatura very baja))
)

; Temperatura-suciedad
;(defrule temperatura-limpio
;	(suciedad limpio)
;	=> (assert (temperatura very baja))
;)

;(defrule temperatura-normal
;	(suciedad normal)
;	=> (assert (temperatura more-or-less media))
;)
;
;(defrule temperatura-very-sucio
;	(suciedad very sucio)
;	=> (assert (temperatura alta))
;)

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
	=> (assert (tiempo-lavado more-or-less corto))
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
	=> (assert (cantidad estandar))
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
	?f <- (lavado (peso-crisp ?peso) (suciedad-crisp ?suciedad) 
		(max-tiempo-lavado-crisp ?maxlav) )
	(tiempo-lavado ?tlav)
	(cantidad ?cant)
	(temperatura ?temp)
	(test (= ?maxlav 0.0))
=>
	(modify ?f (max-tiempo-lavado-crisp (maximum-defuzzify ?tlav))
		(mom-tiempo-lavado-crisp (moment-defuzzify ?tlav))
		(max-cantidad-crisp (maximum-defuzzify ?cant))
		(mom-cantidad-crisp (moment-defuzzify ?cant))
	)
	(printout t"Temperatura de lavado por momentum " (moment-defuzzify ?temp) crlf)
)

; Output
(defrule sacarconsola
	?f <- (lavado (peso-crisp ?peso) (suciedad-crisp ?suciedad)
		(max-tiempo-lavado-crisp ?maxlav) (mom-tiempo-lavado-crisp ?momlav) 
		(max-cantidad-crisp ?maxcan) (mom-cantidad-crisp ?momcan))
	(test (<> ?maxlav 0.0))
=>
	(printout t"Tiempo de lavado por momentum " ?momlav crlf)
	(printout t"Tiempo de lavado por maximum " ?maxlav crlf)

	(printout t"Cantidad por momentum " ?momcan crlf)
	(printout t"Cantidad por maximum " ?maxcan crlf)
)

; Input
(defrule leerconsola
	?f <- (lavado (peso-crisp ?peso) (suciedad-crisp ?suciedad) (grado-crisp ?grado) (eco ?eco))
	(test (= ?peso 0.0))
=>
	(printout t"Introduzca la cantidad de ropa a lavar (en kg)" crlf)
	(bind ?peso (read))
	(printout t"Introduzca el grado de suciedad de la ropa (en NTU)" crlf)
	(bind ?suciedad (read))
	(printout t"Introduzca el grado de delicadeza de la ropa (en %)" crlf)
	(bind ?grado (read))
	(printout t"Introduzca el estado del modo eco (on/off)" crlf)
	(bind ?eco (read))


	(modify ?f (peso-crisp ?peso) (suciedad-crisp ?suciedad) (grado-crisp ?grado) (eco ?eco))
	(fuzzify peso ?peso 0)
	(fuzzify suciedad ?suciedad 0)
	(fuzzify grado ?grado 0)
)

(deffacts ini
	(lavado (peso-crisp 0.0) (suciedad-crisp 0.0) (grado-crisp 0.0) (eco off)
		(max-tiempo-lavado-crisp 0.0) (mom-tiempo-lavado-crisp 0.0)
		(max-cantidad-crisp 0.0) (mom-cantidad-crisp 0.0)
	)
)