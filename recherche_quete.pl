% A la recheche d'une quête
% TP3 info501
% Kevin Traini


% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Initialisations de bases
:- retractall(caract(_, _, _)). % Caractéristiques de naissance
:- retractall(position_courante(_)). % On n'est pas né, donc on est nul part


% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
choix(Force, Taille, Intelligence) :-
    atom(Force), atom(Taille), atom(Intelligence),
    caract(_, _, _),
    write("Vous êtes déjà né !"), nl,
    fail.

choix(Force, Taille, Intelligence) :-
    atom(Force), atom(Taille), atom(Intelligence),
    assert(caract(Force, Taille, Intelligence)),
    histoire.

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Utilitaires de la partie
fin :-
    nl,
    write("Au revoir, et à bientôt dans le monde merveilleux de l'imagination !"),
    nl,
    halt.

naissance :-
    nl,
    write("En l'an de grâce .... En fait je sais pas quand est-ce que vous êtes né."), nl,
    write("Bref, quand vous êtes né, vous avez du faire des choix, comme tout le monde :"), nl,
    write("   1. Devenir fort avec peu de résistance ('fort'), ou faible avec beaucoup de résistance ('faible')."), nl,
    write("   2. Etre grand ou petit."), nl,
    write("   3. Etre intelligent ou idiot."), nl,
    nl,
    write("Pour faire votre choix faites : choix(force, taille, intelligence)."), nl,
    nl,
    assert(position_courante(debut)).
    
    
% Pour lancer la partie
jouer :-
    naissance.

histoire :-
    position_courante(Position),
    decrire(Position),
    options(Position).

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Déplacement
continuer :-
    position_courante(debut),
    nl,
    write("Vous continuer de marcher indéfiniment jusqu'à votre mort."),
    nl,
    write("Vous avez perdu !"), nl,
    fin.

continuer :- % Pour tout les autres cas de continuer
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

rapprocher :-
    position_courante(debut),
    nl,
    write("Vous vous rapprocher du vieil homme"),
    nl,
    nl, !.

rapprocher :- % Pour tout les autres cas de rapprocher
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Lieux

decrire(debut) :-
    nl,
    write("A une certaine époque, dans un certain lieu, le royaume d'Hediata profite d'une paix qui dure depuis des siècles avec le royaume voisin des démons."), nl,
    write("Vous êtes un jeune chevalier qui vient d'obtenir sa licence, et pour entrer en master vos professeur vous demande de réaliser une quête. Ils vous en proposent même plusieurs :"), nl,
    nl,
    write("   - le Graal"), nl,
    write("   - la grande question de la vie"), nl,
    write("   - ..."), nl,
    nl,
    write("Mais vous les refusez toutes, vous les trouvez trop faciles, vous partez donc en balade dans la forêt partiellement magique à la recherche d'une princesse en détresse (vous êtes chevalier après tout)."), nl,
    write("Au bout d'a peine 10 heures de marche, vous croisez une première personnes, il s'agit d'un vieil homme assis sur le bord du chemin, il a un bâton dans la main gauche."), nl,
    nl.

options(debut) :-
    nl,
    write("Vous pouvez soit 'continuer', soit vous 'rapprocher' du vieil homme."), nl,
    nl.