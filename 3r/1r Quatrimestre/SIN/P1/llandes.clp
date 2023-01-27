; Problema llandes SIN 2020/2021
; Autors: Iñaki Diez Lambies i Joan Juan Llopis

; Variables globals
(defglobal  ?*L* = 11)
(defglobal ?*N* = 0)

; Base de fets:
(deffacts bf 
    (D 8 5) ; D=Dimensió (D ?x ?y)
    (C 1 5) (C 1 3) (C 2 1) (C 4 5) (C 4 3) 
    (C 6 1) (C 7 5) (C 8 3) (C 8 1) ; C=Contenidor (C ?xc ?yc)
    (R 2 3 LL L 3 3 L 3 1 L 6 4 n 0))
    ; R=Robot LL=Llandes L=Llanda
    ; (R ?xr ?yr LL [L ?xl ?yl])
;..............................................................
; Moure al buit
(defrule ba (R ?rx ?ry LL $?ll n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C ?rx =(- ?ry 1))) ; Comprovem que no hi ha cap contenidor
    (test (not (member$ (create$ L ?rx (- ?ry 1)) ?ll))) ; Comprovem que no hi ha cap llanda
    (test (not (> 1 (- ?ry 1)))) 
    (test (< ?n ?*L*))
    => ; Comprovem que no mos eixim del terreny
    (assert (R ?rx (- ?ry 1) LL $?ll n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1))) ; Menegem el robot a la posició

(defrule pu (R ?rx ?ry LL $?ll n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C ?rx =(+ ?ry 1)))
    (test (not (member$ (create$ L ?rx (+ ?ry 1)) ?ll)))
    (test (not (< ?y (+ ?ry 1)))) 
    (test (< ?n ?*L*))
    =>
    (assert (R ?rx (+ ?ry 1) LL $?ll n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule es (R ?rx ?ry LL $?ll n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C =(- ?rx 1) ?ry ))
    (test (not (member$ (create$ L (- ?rx 1) ?ry) ?ll)))
    (test (not (> 1 (- ?rx 1)))) 
    (test (< ?n ?*L*))
    =>
    (assert (R (- ?rx 1) ?ry LL $?ll n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule dr (R ?rx ?ry LL $?ll n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C =(+ ?rx 1) ?ry))
    (test (not (member$ (create$ L (+ ?rx 1) ?ry) ?ll)))
    (test (not (< ?x (+ ?rx 1)))) 
    (test (< ?n ?*L*))
    =>
    (assert (R (+ ?rx 1) ?ry LL $?ll n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))


; Menejar una llanda al buit
(defrule be (R ?rx ?ry LL $?r1 L ?rx ?ly $?r2 n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C ?rx =(- ?ry 2)))
    (test (= ?ly (- ?ry 1)))
    (test (not (member$ (create$ L ?rx (- ?ly 1)) $?r1)))
    (test (not (member$ (create$ L ?rx (- ?ly 1)) $?r2)))
    (test (not (> 1 (- ?ly 1)))) 
    (test (< ?n ?*L*))
    =>
    (assert (R ?rx (- ?ry 1) LL $?r1 L ?rx =(- ?ly 1) $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule pe (R ?rx ?ry $?r1 L ?rx ?ly $?r2 n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C ?rx =(+ ?ry 2)))
    (test (= ?ly (+ ?ry 1)))
    (test (not (member$ (create$ L ?rx (+ ?ly 1)) $?r1)))
    (test (not (member$ (create$ L ?rx (+ ?ly 1)) $?r2)))
    (test (not (< ?y (+ ?ly 1)))) 
    (test (< ?n ?*L*))
    =>
    (assert (R ?rx (+ ?ry 1) $?r1 L ?rx =(+ ?ly 1) $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule ee (R ?rx ?ry $?r1 L ?lx ?ry $?r2 n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C =(- ?rx 2) ?ry))
    (test (= ?lx (- ?rx 1)))
    (test (not (member$ (create$ L (- ?lx 1) ?ry) $?r1)))
    (test (not (member$ (create$ L (- ?lx 1) ?ry) $?r2)))
    (test (not (> 1 (- ?lx 1)))) 
    (test (< ?n ?*L*))
    =>
    (assert (R (- ?rx 1) ?ry $?r1 L =(- ?lx 1) ?ry $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule de (R ?rx ?ry $?r1 L ?lx ?ry $?r2 n ?n) (C ?cx ?cy) (D ?x ?y)
    (not (C =(+ ?rx 2) ?ry))
    (test (= ?lx (+ ?rx 1)))
    (test (not (member$ (create$ L (+ ?lx 1) ?ry) $?r1)))
    (test (not (member$ (create$ L (+ ?lx 1) ?ry) $?r2)))
    (test (not (< ?x (+ ?lx 1)))) 
    (test (< ?n ?*L*))
    =>
    (assert (R (- ?rx 1) ?ry $?r1 L =(+ ?lx 1) ?ry $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

; Menejar una llanda al contenidor
(defrule bc (R ?rx ?ry LL $?r1 L ?rx ?ly $?r2 n ?n) (C ?rx ?cy) (D ?x ?y)
    (test (= ?cy (- ?ry 2)))
    (test (= ?ly (- ?ry 1))) 
    (test (< ?n ?*L*))
    =>
    (assert (R ?rx (- ?ry 1) LL $?r1 $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule pc (R ?rx ?ry LL $?r1 L ?rx ?ly $?r2 n ?n) (C ?cx ?cy) (D ?x ?y)
    (test (= ?cy (+ ?ry 2)))
    (test (= ?ly (+ ?ry 1))) 
    (test (< ?n ?*L*))
    =>
    (assert (R ?rx (+ ?ry 1) LL $?r1 $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule ec (R ?rx ?ry LL $?r1 L ?lx ?ry $?r2 n ?n) (C ?cx ?cy) (D ?x ?y)
    (test (= ?cx (- ?rx 2)))
    (test (= ?lx (- ?rx 1))) 
    (test (< ?n ?*L*))
    =>
    (assert (R (- ?rx 1) ?ry LL $?r1 $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule dc (R ?rx ?ry LL $?r1 L ?lx ?ry $?r2 n ?n) (C ?cx ?cy) (D ?x ?y)
    (test (= ?cx (+ ?rx 2)))
    (test (= ?lx (+ ?rx 1))) 
    (test (< ?n ?*L*))
    =>
    (assert (R (- ?rx 1) ?ry LL $?r1 $?r2 n (+ ?n 1)))
    (bind ?*N* (+ ?*N*  1)))

(defrule obj (declare (salience 1)) (R ?rx ?ry LL n ?n)
    => (printout t "Conseguit en n=" ?n " nivells i N=" ?*N* " nodes." crlf) (halt))
;...................................................................
(watch facts)
(watch activations)
(set-strategy breadth) ;depth i breadth
(reset)
(run)
(exit)
