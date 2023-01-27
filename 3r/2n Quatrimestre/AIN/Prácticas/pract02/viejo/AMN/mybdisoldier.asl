//TEAM_AXIS

+flag (F): team(200)
  <-
  .wait(5000);
  ?position(P);
  .pos_to_int(P, IP);
  +minPos(IP);
  .get_backups;
  .wait(1000);
  ?myBackups(B);
  .length(B, Bl);
  +numBack(Bl);

  .send(B, tell, checkPos(IP));

  .create_control_points(F,15,3,C);
  +control_points(C);
  .length(C,L);
  +total_control_points(L);
  +patroll_point(0).

+checkPos(OP)[source(S)]
  <-
  .wait(1000);
  ?flag(F);
  ?minPos(MP);
  .return_closer(MP, OP, F, CP);
  if(CP == MP){
    -+minPos(MP);
    //.print("Yo mayor");
  };
  if(CP == OP){
    -+minPos(OP);
    //.print("Es mayor ", S);
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
    +patrolling;
  };
  if(Bl > 1) {
    -+numBack(Bl - 1);
  }.
  

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