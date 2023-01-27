//TEAM_AXIS

+flag (F): team(200)
  <-
  +patroll_point(F);
  .goto(F).

+enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS) : friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, FPOS)
  <-
  .is_not_friend_in_shoot(ANGLE, DIST, FANGLE, FDIST, DNS);
  .stop;
  if(DNS) {
    .shoot(3, POS);
  };
  -enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS).

+enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS)
  <-
  .stop;
  .shoot(3, POS);
  -enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS).

+friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, [FX, FY, FZ])
  <-
  -friends_in_fov(FID, FTYPE, FANGLE, FDIST, FHEALTH, [FX, FY, FZ]).

-enemies_in_fov(ID, TYPE, ANGLE, DIST, HEALTH, POS)
  <-
  ?patroll_point(F);
  .goto(F).