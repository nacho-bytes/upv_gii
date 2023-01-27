model('ibiza', 'seat'). % ibiza es un modelo de la marca seat
model('cordoba', 'seat'). 
model('altea', 'seat').
model('golf', 'volkswagen').
model('touran', 'volkswagen').
model('clio', 'renault').
model('twingo', 'renault').
model('mÃ©gane', 'renault').
model('scÃ©nic', 'renault').
model('2008', 'peugeot').
model('3008', 'peugeot').
model('corsa', 'opel').

country('seat', 'espaÃ±a'). % seat es una marca fabricada en espaÃ±a
country('renault', 'francia').
country('peugeot', 'francia').
country('volkswagen', 'alemania').
country('opel', 'alemania').

since('ibiza', 1984). % ibiza es un modelo fabricado desde 1984
since('cordoba', 1993).
since('altea', 2004).
since('golf', 1974).
since('touran', 2003).
since('clio', 1990).
since('twingo', 1993).
since('mÃ©gane', 1995).
since('scÃ©nic', 1995).
since('2008', 2013).
since('3008', 2008).
since('corsa', 1982).

segment('ibiza', 'b'). % ibiza es un modelo del Segmento B
segment('cordoba', 'b').
segment('altea', 'c'). 
segment('golf', 'c').
segment('touran', 'c').
segment('clio', 'b').
segment('twingo', 'a').
segment('mÃ©gane', 'c').
segment('scÃ©nic', 'c').
segment('2008', 'b').
segment('3008', 'c').
segment('corsa', 'b').

% A es marca de B si B es modelo de A
brand(A,B) :- model(B,A).

% A es modelo del paÃ­s B si A es modelo de C y C es del paÃ­s B
isModelFrom(A,B) :- model(A,C), country(C,B).

% A y B son modelos de la misma marca C si ...
isSameBrand(A,B) :- model(A,C), model(B,C), A \== B.        

% A y B son modelos del mismo aÃ±o si ...
isSameYear(A,B) :- since(A,C), since(B,C), A \== B.

% A y B estan relacionados si ...
isRelated(A,B) :- isSameBrand(A,B).
isRelated(A,B) :- isSameYear(A,B).
isRelated(A,B) :- segment(A,C), segment(B,C), A \== B. 
isRelated(A,B) :- isClassic(A), isClassic(B).

% A es pais de B si B es modelo de A
isCountryOf(A,B) :- isModelFrom(B,A).

% A es classic si se fabricó antes de 1995
isClassic(A) :- since(A,X), X < 1995.

tab(0).
tab(N) :- put(32), X is N - 1, tab(X).