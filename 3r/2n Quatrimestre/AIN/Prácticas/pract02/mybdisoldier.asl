//TEAM_AXIS

+flag (F): team(200)
  <-
  // Rutina de elección de general
  ?position(P);
  .pos_to_int(P, IP);
  +minPos(IP);
  .wait(1000);
  .get_backups;
  .wait(1000);
  ?myBackups(B);
  .length(B, Bl);
  +backsResLeft(Bl);
  +numBack(Bl);
  .send(B, tell, checkPos(IP)).

// Cuando se elige general este 
// reparte los puntos al resto de soldados
+general
  <-
  ?flag(F);
  ?numBack(Bl);
  ?myBackups(B);
  .create_circle_points(F, 15, Bl, Pts);
  +i(Bl-1);
  while(i(N) & N >= 0)
  {
    .nth(N, B, S);
    .nth(N, Pts, Pt);
    .send(S, tell, myPos(Pt));
    -+i(N-1);
  }
  // Se mueve a la bandera
  +patroll_pos(F);
  +patrolling.

+enemySeen(POS)[source(S)] : general
  <-
  .get_backups;
  .wait(1000);
  ?myBackups(B);
  .send(B, tell, enemySeen(POS));
  -enemySeen(POS).
  
+enemySeen(POS)[source(S)] : not (enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS))
  <-
  -patrolling;
  -enemySeen(POS);
  .goto(POS).
  
// Se estudia si el soldado
// debería de ser capitán
+checkPos(OP)[source(S)]
  <-
  .wait(500);
  ?flag(F);
  ?minPos(MP);
  .return_closer(MP, OP, F, CP);
  if(CP == MP){
    -+minPos(MP);
  };
  if(CP == OP){
    -+minPos(OP);
  };
  ?backsResLeft(Bl);
  if(Bl == 1){
    -backsResLeft(_);
    ?minPos(MIN);
    ?position(MINE);
    .pos_to_int(MINE, IMINE);
    if(MIN == IMINE) {
      +general;
      .print("Yo general");
    };
  };
  if(Bl > 1) {
    -+backsResLeft(Bl - 1);
  }.

// Se le asigna una posición al soldado
+myPos(OP)[source(S)]
  <-
  +isCaptain(S);
  +patroll_pos(OP);
  +patrolling.

// Gestion peticiones de curacion
+health(X): X < 50 & not (pedidaayuda)
  <-
  +pedidaayuda;
  .get_medics.
  
// Si me estan disparando busco al enemigo
+health(H) : lastHealth(LH) & not (enemies_in_fov(EID, ETYPE, EANGLE, EDIST, EHEALTH, EPOS)) & LH < H
  <-
  .turn(3.141516 / 6);
  -+lastHealth(H).

+health(H)
  <-
  +lastHealth(H).
  
+myMedics(M): pedidaayuda
  <-
  .print("Medic pls");
  ?position(Pos);
  +bids([]);
  +agents([]);
  .send(M, tell, savemeproposal(Pos));  
  .wait(1000); 
  !elegirmejor;
  -myMedics(_).

+mybid(Pos)[source(A)]:  pedidaayuda
  <-
  ?bids(B);
  .concat(B, [Pos], B1);  -+bids(B1);  
  ?agents(Ag); 
  .concat(Ag, [A], Ag1);  -+agents(Ag1); 
  -mybid(Pos).

+!elegirmejor: bids(Bi) & agents(Ag)
<-
  if(not (Bi==[])){
    ?position(MiPos);
    .mejor_bid(Bi, MiPos, Idx);
    .nth(Idx, Bi, Pos);  // no elijo el mejor, me quedo con el primero
    .nth(Idx, Ag, A);
    .print("Vente ", A);
    .send(A, tell, acceptproposal);
    .delete(0, Ag, Ag1);
    .send(Ag1, tell, cancelproposal);
    -+bids([]);
    -+agents([]);
  }.
   
+!elegirmejor: not (bids(Bi))
<-  
  .print("Voy a morir");
  -pedidaayuda. 


// Gestion peticiones de municion
+ammo(X): X < 50 & not (pedidaammo)
  <-
  +pedidaammo;
  .get_fieldops.
  
+myFieldops(M): pedidaammo
  <-
  .print("Ammo pls");
  ?position(Pos);
  +ammobids([]);
  +ammoagents([]);
  .send(M, tell, ammomeproposal(Pos));  
  .wait(1000); 
  !elegirmejorammo;
  -myFieldops(_).

+ammoBid(Pos)[source(A)]:  pedidaammo
  <-
  ?ammobids(B);
  .concat(B, [Pos], B1);  -+ammobids(B1);  
  ?ammoagents(Ag); 
  .concat(Ag, [A], Ag1);  -+ammoagents(Ag1); 
  -ammoBid(Pos).

+!elegirmejorammo: ammobids(Bi) & ammoagents(Ag)
<-
  if(not (Bi==[])){
    ?position(MiPos);
    .mejor_bid(Bi, MiPos, Idx);
    .nth(Idx, Bi, Pos);  // no elijo el mejor, me quedo con el primero
    .nth(Idx, Ag, A);
    .print("Vente ", A);
    .send(A, tell, acceptammoproposal);
    .delete(0, Ag, Ag1);
    .send(Ag1, tell, cancelammoproposal);
    -+ammobids([]);
    -+ammoagents([]);
  }.
   
+!elegirmejorammo: not (ammobids(Bi))
<-  
  .print("No ammo");
  -pedidaammo. 

// MOVIMIENTO Y DISPARO
+enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS) : ammo(A) & A == 0
  <-
  -enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS).

+enemies_in_fov(EID, ETYPE, EANGLE, EDIST, EHEALTH, EPOS) : friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS)
  <-
  ?position(POS);
  .is_friend_in_shoot(POS, EPOS, FPOS, FDIST, IS);
  -patrolling;
  .stop;
  .look_at(EPOS);
  if(not IS) {
    .shoot(3, EPOS);
  };
  
  ?isCaptain(C);
  .send(C, tell, enemySeen(EPOS));
  
  -friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS).

+enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS)
  <-
  -patrolling;
  .stop;
  .look_at(POS);
  .shoot(3, POS);
  
  ?isCaptain(C);
  .send(C, tell, enemySeen(POS)).

+friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, [FX, FY, FZ])
  <-
  -friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, [FX, FY, FZ]).

-enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS)
  <-
  +patrolling.
  
+target_reached(T): patrolling & team(200)
  <-
  ?flag(F);
  .get_turn(T, F, TURN);
  .look_at(TURN);
  -patrolling;
  -target_reached(T).

+patrolling
  <-
  ?patroll_pos(A);
  .goto(A).
