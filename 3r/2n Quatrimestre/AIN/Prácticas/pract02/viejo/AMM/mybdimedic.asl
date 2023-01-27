//TEAM_AXIS

//Tareas a realizar:
// Cuando la vida de un soldado baje de 35, pedir un medico
// 

+flag (F): team(200)
  <-
  .create_cirlce_points(F,5,6,C);
  +control_points(C);
  .length(C,L);
  +total_control_points(L);
  +patrolling;
  +patroll_point(0);
  .nth(0,C,MP);
  +miPosicion(MP).

+savemeproposal(Pos)[source(A)]: not (ayudando(_,_))
<-
 ?position(MiPos);
  .send(A, tell, mybid(MiPos));
  +ayudando(A, Pos);
  -savemeproposal(_);
 .print("enviada propuesta de ayuda").
  
+cancelproposal[source(A)]: ayudando(A, Pos)
<-
  .print("Me cancelan mi proposicion");
  -ayudando(A, Pos).
  
+acceptproposal[source(A)]: ayudando(A, Pos)
<- 
  .print("Me voy a ayudar al agente: ", A, "a la posicion: ", Pos);
  -patrolling;
  .goto(Pos).
  
+target_reached(T): ayudando(A, T)
  <-
    .print("MEDPACK! para el agente:", A);
    .cure;
    .cure;
    .cure;
    ?miPosicion(P);
    .goto(P);
    -ayudando(A, Pos);
    -target_reached(T).
    

+target_reached(T): patrolling
  <-
  ?patroll_point(P);
  ?control_points(C);
  -+patroll_point(P+1);
  .nth(P,C,MP);
  -+miPosicion(MP).
  -target_reached(T).
    
+enemies_in_fov(EID, ETYPE, EANGLE, EDIST, EHEALTH, EPOS) : friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS) & not (ayudando(_,_))
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

+enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS): not (ayudando(_,_))
  <-
  -patrolling;
  .stop;
  .shoot(3, POS);
  -enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS).

+friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS)
  <-
  -friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS).

-enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS) : not (ayudando(_,_))
  <-
  +patrolling;
  ?patroll_point(F);
  ?control_points(C);
  .nth(F,C,A);
  .goto(A).

+patroll_point(P): total_control_points(T) & P<T & not (ayudando(_,_))
  <-
  ?control_points(C);
  .nth(P,C,A);
  .goto(A).

+patroll_point(P): total_control_points(T) & P==T & not (ayudando(_,_))
  <-
  -patroll_point(P);
  +patroll_point(0).

+target_reached(T): not (ayudando(_,_))
  <- 
  .print("estoy en mi posicion").