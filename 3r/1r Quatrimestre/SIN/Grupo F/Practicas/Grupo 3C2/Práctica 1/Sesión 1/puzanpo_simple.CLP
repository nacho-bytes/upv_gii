;; =========================================================
;; ===     A N C H U R A   Y    P R O F U N D I D A D   ====
;; =========================================================

(deffacts bh (puzzle 0 2 3 1 8 4 7 6 5))

(defrule derecha
  ?f<-(puzzle $?x 0 ?y $?z)
  (test (and (<> (length$ $?x) 2) (<> (length$ $?x) 5)))
  =>
  (assert (puzzle $?x ?y 0 $?z)))


(defrule izquierda
  ?f<-(puzzle $?x ?y 0 $?z)
  (test (and (<> (length$ $?x) 2) (<> (length$ $?x) 5)))
  =>
  (assert (puzzle $?x 0 ?y $?z)))


(defrule abajo
  ?f<-(puzzle $?x 0 ?a ?b ?c $?z)
  =>
  (assert (puzzle $?x ?c ?a ?b 0 $?z)))


(defrule arriba
  ?f<-(puzzle $?x ?a ?b ?c 0 $?y)
  =>
  (assert (puzzle $?x 0 ?b ?c ?a $?y)))

(defrule objetivo
    (declare (salience 100))
    ?f<-(puzzle 1 2 3 8 0 4 7 6 5)
   =>
    (halt))		
