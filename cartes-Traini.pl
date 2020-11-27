contient([X | _], X).
contient([_ | L], X) :- contient(L, X).

dernier([_, X], X).
dernier([_ | L], X) :- dernier(L, X).

voisins([X, Y | _], X, Y).
voisins([Y, X | _], X, Y).
voisins([_ | L], X, Y) :- voisins(L, X, Y).

devant([X | L], X, Y) :- contient(L, Y).
devant([_ | L], X, Y) :- devant(L, X, Y).

solution_as(L) :-
    L = [_, _, _, _], % La solution contient 4 éléments

    contient(L, pique),   % Il y a au moins un as de pique
    contient(L, trefle),  % Il y a au moins un as de trefle
    contient(L, coeur),   % Il y a au moins un as de coeur
    contient(L, carreau), % Il y a au moins un as de carreau

    % En 2, il n'y a ni l'as de trèfle, ni l'as de pique.
    L \= [_, trefle, _, _],
    L \= [_, pique, _, _],
    
    %  L'as de trèfle est plus à droite que l'as de carreau. 
    devant(L, carreau, trefle),

    %  L'as de carreau et l'as de cœur ne sont pas à côté l'un de l'autre. 
    \+ voisins(L, carreau, coeur).
