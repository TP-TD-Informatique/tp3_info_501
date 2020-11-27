% Question 7
contient1(A,[A|_]).
contient1(A,[_|L]) :- contient1(A,L).

contient2(A,[_|L]) :- contient2(A,L).
contient2(A,[A|_]).

contient3(A,[A|_]) :- !.
contient3(A,[_|L]) :- contient3(A,L).

contient4(A,[_|L]) :- contient4(A,L).
contient4(A,[A|_]) :- !.