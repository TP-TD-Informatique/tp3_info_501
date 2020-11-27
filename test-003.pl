% Question 5
%deuxieme(X, []) :- fail.
%deuxieme(X, [Y]) :- fail.
%deuxieme(X, [Y, Z | L]) :- X = Z.
deuxieme(X, [_, X | _]).