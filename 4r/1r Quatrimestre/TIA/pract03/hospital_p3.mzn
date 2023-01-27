% Model of a hospital

% Parameters
int: numSurgeons = 5;
int: reqSurgeons = 1;
int: numAnesthetists = 3;
int: reqAnesthetists = 1;
int: numNurses = 5;
int: reqNurses = 2;
int: numTechSurgeons = 9;
int: reqTechSurgeons = 2;

int: maxTimeMinPerTurn = 360;
int: maxSurgeriesPerTurn = 3;
int: numSurgeries = 7;
array[1..numSurgeries] of int: surgeryDurationMin = [60, 120, 180, 30, 45, 60, 80];

array[1..numSurgeons, 1..numSurgeries] of var 0..1: surgeons;
array[1..numAnesthetists, 1..numSurgeries] of var 0..1: anesthetists;
array[1..numNurses, 1..numSurgeries] of var 0..1: nurses;
array[1..numTechSurgeons, 1..numSurgeries] of var 0..1: techSurgeons;

% Operating room requirement
constraint forall(i in 1..numSurgeries) (sum (j in 1..numSurgeons) (surgeons[j, i]) >= reqSurgeons);
constraint forall(i in 1..numSurgeries) (sum (j in 1..numAnesthetists) (anesthetists[j, i]) >= reqAnesthetists);
constraint forall(i in 1..numSurgeries) (sum (j in 1..numNurses) (nurses[j, i]) >= reqNurses);
constraint forall(i in 1..numSurgeries) (sum (j in 1..numTechSurgeons) (techSurgeons[j, i]) >= reqTechSurgeons);

% Nobody can accumulate more thatn 360 min
constraint forall(i in 1..numSurgeons) (sum (j in 1..numSurgeries) (surgeons[i, j] * surgeryDurationMin[j]) <= maxTimeMinPerTurn);
constraint forall(i in 1..numAnesthetists) (sum (j in 1..numSurgeries) (anesthetists[i, j] * surgeryDurationMin[j]) <= maxTimeMinPerTurn);
constraint forall(i in 1..numNurses) (sum (j in 1..numSurgeries) (nurses[i, j] * surgeryDurationMin[j]) <= maxTimeMinPerTurn);
constraint forall(i in 1..numTechSurgeons) (sum (j in 1..numSurgeries) (techSurgeons[i, j] * surgeryDurationMin[j]) <= maxTimeMinPerTurn);

% Nobody can do more than 3 surgeries
constraint forall(i in 1..numSurgeons) (sum (j in 1..numSurgeries) (surgeons[i, j]) <= maxSurgeriesPerTurn);
constraint forall(i in 1..numAnesthetists) (sum (j in 1..numSurgeries) (anesthetists[i, j]) <= maxSurgeriesPerTurn);
constraint forall(i in 1..numNurses) (sum (j in 1..numSurgeries) (nurses[i, j]) <= maxSurgeriesPerTurn);
constraint forall(i in 1..numTechSurgeons) (sum (j in 1..numSurgeries) (techSurgeons[i, j]) <= maxSurgeriesPerTurn);

% Surgeon cant do two consecutive surgeries
constraint forall(i in 1..numSurgeons) (forall(j in 1..numSurgeries-1) (surgeons[i, j] + surgeons[i, j+1] < 2));

% Techsurgeon interns
% T8
constraint forall(j in 1..numSurgeries) (techSurgeons[8, j] == 1 -> techSurgeons[1, j] == 1);
constraint sum(j in 1..numSurgeries) (techSurgeons[8, j]) >= 1;
% T9
constraint forall(j in 1..numSurgeries) (techSurgeons[9, j] == 1 -> techSurgeons[1, j] == 1);
constraint sum(j in 1..numSurgeries) (techSurgeons[9, j]) >= 1;

% Techsurgeons interns don't get allong
constraint forall(j in 1..numSurgeries) (techSurgeons[8, j] + techSurgeons[9, j] <= 1);
constraint techSurgeons[9, 1] == 0;

% Surgeons specifications
% O1
constraint surgeons[2, 1] = 1 xor surgeons[3, 1] = 1 xor surgeons[4, 1] = 1;
% O2
constraint surgeons[1, 2] = 1 xor surgeons[2, 2] = 1;
% O3
constraint surgeons[1, 3] = 1 xor surgeons[3, 3] = 1 xor surgeons[5, 1] = 1;
% O4
constraint sum (i in 1..numSurgeons) (surgeons[i, 4]) >= 2;

% Satisfaction
%solve satisfy;

% Optimally
solve minimize sum (i in 1..numSurgeries) (surgeons[3, i] * surgeryDurationMin[i]);

/*
output ["Operations:"] ++
  [("\n\tNumber " ++ show(j) ++ " " ++ 
    if surgeons[i, j] == 1 then ("C" ++ show(i)) else "" | i in 1..numSurgeons j in 1..numSurgeries]*/