%%% INFO-501, TP3
%%% Pierre Hyvernat
%%%
%%% Lancez la "requête"
%%% jouer.
%%% pour commencer une partie !
%

% il faut déclarer les prédicats "dynamiques" qui vont être modifiés par le programme.
:- dynamic position/2, position_courante/1.

% on remet à jours les positions des objets et du joueur
:- retractall(position(_, _)), retractall(position_courante(_)).

% on déclare des opérateurs, pour autoriser `prendre torche` au lieu de `prendre(torche)`
:- op(1000, fx, prendre).
:- op(1000, fx, lacher).
:- op(1000, fx, aller).



% position du joueur. Ce prédicat sera modifié au fur et à mesure de la partie (avec `retract` et `assert`)
position_courante(quelque_part).

% passages entre les différent endroits du jeu
passage(quelque_part, nord, quelque_part).

% position des objets
position(truc, quelque_part).


% ramasser un objet
prendre(X) :-
        position(X, en_main),
        write("Vous l'avez déjà !"), nl,
        !.

prendre(X) :-
        position_courante(P),
        position(X, P),
        retract(position(X, P)),
        assert(position(X, en_main)),
        write("OK."), nl,
        !.

prendre(X) :-
        write("??? Je ne vois pas de "),
        write(X),
        write(" ici."), nl,
        fail.


% laisser un objet
lacher(X) :-
        position(X, en_main),
        position_courante(P),
        retract(position(X, en_main)),
        assert(position(X, P)),
        write("OK."), nl,
        !.

lacher(_) :-
        write("Vous n'avez pas ça en votre possession !"), nl,
        fail.


% quelques raccourcis
n :- aller(nord).
s :- aller(sud).
e :- aller(est).
o :- aller(ouest).


% déplacements
aller(Direction) :-
        position_courante(Ici),
        passage(Ici, Direction, La),
        retract(position_courante(Ici)),
        assert(position_courante(La)),
        regarder, !.

aller(_) :-
        write("Vous ne pouvez pas aller par là."),
        fail.


% regarder autour de soi
regarder :-
        position_courante(Place),
        decrire(Place), nl,
        lister_objets(Place), nl.


% afficher la liste des objets à l'emplacement donné
lister_objets(Place) :-
        position(X, Place),
        write("Il y a "), write(X), write(" ici."), nl,
        fail.

lister_objets(_).


% fin de partie
fin :-
        nl, write("La partie est finie."), nl,
        halt.


% affiche les instructions du jeu
instructions :-
        nl,
        write("Les commandes doivent être données avec la syntaxe Prolog habituelle."), nl,
        write("Les commandes existantes sont :"), nl,
        write("jouer.                   -- pour commencer une partie."), nl,
        write("n.  s.  e.  o.           -- pour aller dans cette direction (nord / sud / est / ouest)."), nl,
        write("aller(direction)         -- pour aller dans cette direction."), nl,
        write("prendre(objet).          -- pour prendre un objet."), nl,
        write("lacher(objet).           -- pour lacher un objet en votre possession."), nl,
        write("regarder.                -- pour regarder autour de vous."), nl,
        write("instructions.            -- pour revoir ce message !."), nl,
        write("fin.                     -- pour terminer la partie et quitter."), nl,
        nl.



% lancer une nouvelle partie
jouer :-
        instructions,
        regarder.


% descriptions des emplacements
decrire(quelque_part) :-
    write("Vous êtes quelque part."), nl.

