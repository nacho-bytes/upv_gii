myappend([],L,L).
myappend([E|L1],L2,[E|L3]) :- myappend(L1,L2,L1).