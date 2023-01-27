; Base de hechos:
; R=Robot XX=Enemigos X=Enemigo CC=Cajas C=Caja
; (R ?c ?f ?t XX [X ?cx ?fx]ˆm CC [C ?cc ?fc]ˆn)
; c=col f=fila t=tiros cx/fx=col/fila enemigo cc/fc=col/fila caja
; D=Dimensiones (D ?col_ini ?col_fin)
; E=Escaleras (E ?c ?f)
; H=Huecos (H ?c ?f)
(deffacts bh 
  (D 1 3) 
  (E 3 1)
  (R 1 1 1 XX X 2 2 CC C 1 2))

(defrule su 
 (R ?c ?f $?r) 
 (E ?c ?f) 
=> 
 (assert (R ?c (+ ?f 1) ?r)))

(defrule ba 
  (R ?c ?f $?r) 
  (E ?c ?f2) 
  (test (= ?f (+ ?f2 1))) 
=>
  (assert (R ?c ?f2 ?r)))

(defrule iz 
  (R ?c ?f ?t XX $?xx CC $?r) 
  (D ?ci ?) 
  (test (> ?c ?ci))
  (test (not (member$ (create$ X (- ?c 1) ?f) $?xx)))
  (not (H =(- ?c 1) ?f)) 
=>
  (assert (R (- ?c 1) ?f ?t XX $?xx CC ?r)))

(defrule de 
  (R ?c ?f ?t XX $?xx CC $?r) 
  (D ? ?cf) 
  (test (< ?c ?cf))
  (test (not (member$ (create$ X (+ ?c 1) ?f) $?xx)))
  (not (H =(+ ?c 1) ?f)) 
=>
  (assert (R (+ ?c 1) ?f ?t XX $?xx CC ?r)))

(defrule re 
  (R ?c ?f $?r1 C ?c ?f $?r2) 
=>
  (assert (R ?c ?f $?r1 $?r2)))

(defrule di 
  (R ?c ?f ?t $?r1 X ?cx ?f $?r2) 
  (test (> ?t 0))
  (test (or (= ?c (- ?cx 1))(= ?c (+ ?cx 1)))) 
=>
  (assert (R ?c ?f (- ?t 1) $?r1 $?r2)))

(defrule ob 
  (declare (salience 1)) 
  (R $?r1 CC $?r2)
  (test (not (member$ C ?r2))) 
=> 
  (printout t "OK" crlf) 
  (halt))
;...................................................................
