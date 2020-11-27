contient([X | _], X).
contient([_ | L], X) :- contient(L, X).

dernier([_, X], X).
dernier([_ | L], X) :- dernier(L, X).

voisins([X, Y | _], X, Y).
voisins([Y, X | _], X, Y).
voisins([_ | L], X, Y) :- voisins(L, X, Y).

devant([X | L], X, Y) :- contient(L, Y).
devant([_ | L], X, Y) :- devant(L, X, Y).