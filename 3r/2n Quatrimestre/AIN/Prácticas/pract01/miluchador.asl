//Aitana Menárguez Box

+flag(F): team(200)
    <-
    +esquinas([[128,0,35],[221,0,128],[128,0,221],[35,0,128]]);
    +centro([128,0,128]);
    ?position(X);
    ?esquinas(E);
    .get_esquina(X,E,P); //funcion que te devuelve la esquina + cercana
    +patroll_point(P);
    +patrolling;
    !agirar.

// Si ve a alguien le dispara
+friends_in_fov(ID,Type,Angle,Distance,Health,Position) : ammo(A) & A > 0
    <-
    -patrolling;
    .shoot(2,Position);
    .print("Hasta la vista ", ID);
    -+nada.
    
// Cuando recoge un paquete nos avisa
+pack_taken(Type,N) : health(H) & H >= 80 & ammo(A) >= 20
    <-
    +patrolling;
    -+nada.

// Si tiene menos de 80 de vida y ve un paquete de vida va a por él
+packs_in_fov(ID,Type,Angle,Distance,Health,Position): ID==1001 & health(H) & H<20 //salud
    <-
    .goto(Position).

// Si tiene menos de 80 de vida y ve un paquete de munición va a por él
+packs_in_fov(ID,Type,Angle,Distance,Health,Position): ID==1002 & ammo(A) & A<20  //munición
    <-
    .goto(Position).

    
// Si tiene menos de 80 de vida va hacia el centro
+health(H): H<20
    <-
    -patrolling;
    -+patroll_point(5).

// Si tiene menos de 20 de munición va hacia el centro
+ammo(H): H<20
    <-
    -patrolling;
    -+patroll_point(5).

    
// PATROLLING
+target_reached(T): patroll_point(5) // Has llegado al centro
    <-
    -+patroll_point(0);
    -target_reached(T);
    +patrolling.

+target_reached(T): patrolling // Siguiente punto
    <-
    ?patroll_point(P);
    -+patroll_point(P+1);
    -target_reached(T).

+patroll_point(P): P<4 // Siguiente punto
    <-
    ?esquinas(E);
    .nth(P,E,A);
    .goto(A);
    //+agirar;
    //.wait(1000);
    .print("Voy a Pos: ", A).

+patroll_point(P): P==4
    <-
    -patroll_point(P);
    +patroll_point(0).

//////////
+patroll_point(P): P==5
    <-
    ?centro(C);
    .goto(C).
        
+!comprobar: friends_in_fov(_)
    <-
    -patrolling.
    
    
+!agirar: patrolling & destination(P)
    <-
    .stop;
    .print("Modo keyblade");
    
    .cuarto_vuelta(G);
    .turn(G);
    .wait(500);
    
    .cuarto_vuelta(G);
    .turn(G);
    .wait(500);
    
    .cuarto_vuelta(G);
    .turn(G);
    .wait(500);
    
    .goto(P);
    .wait(10000);
    !agirar.

+nada
    <-
    +patrolling.
