contient([X | _], X).
contient([_ | L], X) :- contient(L, X).

dernier([_, X], X).
dernier([_ | L], X) :- dernier(L, X).

voisins([X, Y | _], X, Y).
voisins([Y, X | _], X, Y).
voisins([_ | L], X, Y) :- voisins(L, X, Y).

devant([X | L], X, Y) :- contient(L, Y).
devant([_ | L], X, Y) :- devant(L, X, Y).

% L est une liste de maison(Type, Animal, Boisson, Musique, Métier)
solution(L) :-
    L = [_, _, _, _, _],
    % 1 Le musicien a une tortue.
    contient(L, maison(_, tortue, _, _, musicien)),
    % 2 Le propriétaire de la maison jaune écoute du jazz.
    contient(L, maison(jaune, _, _, jazz, _)),
    % 3 La personne qui écoute du hard-rock a un chat.
    contient(L, maison(_, chat, _, hard-rock, _)),
    % 4 La maison en bois se trouve juste à gauche de la maison blanche.
    voisins(L, maison(bois, _, _, _, _), maison(blanche, _, _, _, _)),
    devant(L, maison(bois, _, _, _, _), maison(blanche, _, _, _, _)),
    % 5 Le chercheur habite dans la maison en briques.
    contient(L, maison(brique, _, _, _, chercheur)),
    % 6 Le footballeur habite juste à coté de l'immeuble.
    voisins(L, maison(_, _, _, _, footballeur), maison(immeuble, _, _, _, _)),
    % 7 La personne qui écoute de la musique classique est voisine de celle qui boit de la bière.
    voisins(L, maison(_, _, _, musique_classique, _), maison(_, _, biere, _, _)),
    % 8 La personne qui écoute du hiphop boit du thé.
    contient(L, maison(_, _, the, hiphop, _)),
    % 9 La personne qui habite dans la maison du milieu boit beaucoup de soda.
    L = [_, _, maison(_, _, soda, _, _), _, _],
    % 10 Le footballeur habite dans la première maison.
    L = [maison(_, _, _, _, footballeur), _, _, _, _],
    % 11 La personne qui écoute de la musique classique est voisine de la personne qui a des poissons.
    voisins(L, maison(_, _, _, musique_classique, _), maison(_, poissons, _, _, _)),
    % 12 Le boulanger écoute de la chanson française.
    contient(L, maison(_, _, _, chanson_francaise, boulanger)),
    % 13 La personne qui a un hamster est voisine de celle qui écoute du jazz.
    voisins(L, maison(_, hamster, _, _, _), maison(_, _, _, jazz, _)),
    % 14 L'architecte boit de l'eau.
    contient(L, maison(_, _, eau, _, architecte)),
    % 15 Le propriétaire de la maison en bois aime bien le whisky.
    contient(L, maison(bois, _, whisky, _, _)),
    % Il y a un zèbre dans une maison
    contient(L, maison(_, zebre, _, _, _)).