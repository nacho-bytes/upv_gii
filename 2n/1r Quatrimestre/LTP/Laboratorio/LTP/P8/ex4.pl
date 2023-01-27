mymember(E,[E|_]).
mymember(E,[H|L]) :- mymember(E,L).