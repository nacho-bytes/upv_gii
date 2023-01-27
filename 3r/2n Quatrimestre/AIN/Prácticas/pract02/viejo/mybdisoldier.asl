//TEAM_AXIS

+flag (F): team(200)
  <-
  ?position(P);
  .pos_to_int(P, IP);
  +minPos(IP);
  .wait(2000);
  .get_backups;
  .wait(2000);
  ?myBackups(B);
  .length(B, Bl);
  +numBack(Bl);

  .send(B, tell, checkPos(IP));

+general
  <-
  .print("xd").

+checkPos(OP)[source(S)]
  <-
  .wait(1000);
  ?flag(F);
  ?minPos(MP);
  .return_closer(MP, OP, F, CP);
  if(CP == MP){
    -+minPos(MP);
  };
  if(CP == OP){
    -+minPos(OP);
  };
  ?numBack(Bl);
  if(Bl == 1){
    ?minPos(MIN);
    ?position(MINE);
    .pos_to_int(MINE, IMINE);
    if(MIN == IMINE) {
      +general;
      .print("Yo general");
    };
  };
  if(Bl > 1) {
    -+numBack(Bl - 1);
  }.
  
// Gestion peticiones de curacion
+health(X): X < 50 & not (pedidaayuda)
  <-
  +pedidaayuda;
  .get_medics.
  
+myMedics(M): pedidaayuda
  <-
  .print("Pido ayuda");
  ?position(Pos);
  +bids([]);
  +agents([]);
  .send(M, tell, savemeproposal(Pos));  
  .wait(1000); 
  !elegirmejor;
  -myMedics(_).

+mybid(Pos)[source(A)]:  pedidaayuda
  <-
  .print("Recibo propuesta");
  ?bids(B);
  .concat(B, [Pos], B1);  -+bids(B1);  
  ?agents(Ag); 
  .concat(Ag, [A], Ag1);  -+agents(Ag1); 
  -mybid(Pos).

+!elegirmejor: bids(Bi) & agents(Ag)
<-
  if(not (Bi==[])){
    ?position(MiPos);
    .print("Selecciono el mejor: ", Bi, Ag);
    .mejor_med(Bi, MiPos, Idx);
    .nth(Idx, Bi, Pos);  // no elijo el mejor, me quedo con el primero
    .nth(Idx, Ag, A);
    .print("el mejor es: ", A);
    .send(A, tell, acceptproposal);
    .delete(0, Ag, Ag1);
    .send(Ag1, tell, cancelproposal);
    -+bids([]);
    -+agents([]);
  }.
   
+!elegirmejor: not (bids(Bi))
<-  
  .print("Nadie me puede ayudar");
  -pedidaayuda. 

+target_reached(T): patrolling & team(200)
  <-
  ?patroll_point(P);
  -+patroll_point(P+1);
  -target_reached(T).

+enemies_in_fov(EID, ETYPE, EANGLE, EDIST, EHEALTH, EPOS) : friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS)
  <-
  ?position(POS);
  .is_friend_in_shoot(POS, EPOS, FPOS, FDIST, IS);
  -patrolling;
  .stop;
  if(not IS) {
    .shoot(3, POS);
  };
  -friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS);
  -enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS).

+enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS)
  <-
  -patrolling;
  .stop;
  .shoot(3, POS);
  -enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS).

+friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, [FX, FY, FZ])
  <-
  -friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, [FX, FY, FZ]).

-enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS)
  <-
  +patrolling;
  ?control_points(C);
  ?patroll_point(P);
  .nth(P,C,A);
  .goto(A).

+patrolling
  <-
  ?patroll_point(P);
  ?control_points(C);
  .nth(P,C,A);
  .goto(A).

+patroll_point(P): total_control_points(T) & P<T & patrolling
  <-
  ?control_points(C);
  .nth(P,C,A);
  .goto(A).

+patroll_point(P): total_control_points(T) & P==T
  <-
  -patroll_point(P);
  +patroll_point(0).