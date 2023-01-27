//Aitana Menárguez Box

+flag(F): team(200)
    <-
    +esquinas([[128,0,35],[221,0,128],[128,0,221],[35,0,128]]);
    ?esquinas(E);
    ?position(X);
    .get_esquina(X,E,P); //funcion que te devuelve la esquina + cercana
    +patroll_point(P);
    +giro(1);
    +patrullar.
    
// ENEMIGOS


// Si ve a alguien le dispara
+friends_in_fov(ID,Type,Angle,Distance,Health,Position) : ammo(A) & A > 0
    <-
    !ataca(Position).

    
+!ataca(P)
    <-
    .print("Pium, pium");
    .shoot(2,P).
    
// PATRULLANDO

+target_reached(T) // Siguiente punto
    <-
    ?patroll_point(P);
    -+patroll_point(P+1);
    -target_reached(T).

+patroll_point(P): P<4 // Siguiente punto
    <-
    ?esquinas(E);
    .nth(P,E,A);
    .goto(A);
    .print("Voy a Pos: ", A).

+patroll_point(P): P==4
    <-
    -patroll_point(P);
    +patroll_point(0).

// GIRO EN PATRULLA
    
+patrullar: destination(P) & giro(G) & G < 4
    <-
    .stop; // Nos quedamos quietos
    .print("Giro tipo ", G);
    
    .calculo_giro(G, V);
    .turn(V);
    -+giro(G + 1);
    .wait(500);
    
    .goto(P);
    .wait(2000);
    -+patrullar.

+patrullar : giro(G) & G == 4
    <-
    -+giro(1);
    -+patrullar.
