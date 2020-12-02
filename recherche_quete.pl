% A la recheche d'une quête
% TP3 info501
% Kevin Traini

:- discontiguous decrire.
:- discontiguous options.

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

recit :-
    nl,
    write("Tout commence il y a plusieurs années, notre royaume vivait en paix, le commerce prosperait, tout le monde était"), nl,
    write("heureux. Jusqu'au jour ou le roi des démons traversa les montagnes bleues en ammenant la guerre. Celle-ci dura"), nl,
    write("pendant 5 rois humains, et toujours le roi des démons nous attaquait. Quand un jour, le jeune roi Sir Wayntal premier"), nl,
    write("du nom décida de jeter toutes nos forces dans la traversée du tunnel."), nl,
    write("La bataille du tunnel dura 3 jours. 3 jours durant lesquels les pertes furent nombreuses, côté humains, mais surtout "), nl,
    write("côté démons. Quand cette bataille fut gagnée notre roi à la tête des troupes investit les marais et se retrouva 1 "), nl,
    write("semaine plus tard au pied du château démon qu'il assiega. C'était la première fois qu'on voyait cette batisse : "), nl,
    write("entièrement noire, elle était immense et semblait impénétrable. Mais au bout de 3 mois de siège les défense céderent "), nl,
    write("et au cours d'une ultime bataille (que l'on nomma plus tard la bataille du Java), notre roi tua le roi des démons. Le "), nl,
    write("château fut incendié et nos troupes revinrent au pays, en condamnant le tunnel."), nl,
    nl.

nom_vieil_homme :-
    nl,
    write("Le vieil homme, content de vous, accepte de vous dire son nom : il s'agit du baron Cavallini, celui dont les terres "), nl,
    write("s'étendent du nord des montagnes jusqu'à l'océan."), nl,
    nl.
    
    
% Pour lancer la partie
jouer :-
    naissance.

histoire :-
    decrire,
    options.

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Déplacement
aide :-
    position_courante(village_col),
    retract(position_courante(village_col)),
    assert(position_courante(fin_aide)),
    histoire, !.

aide :- % Pour tout les autres cas de aide
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

attaquer :-
    position_courante(village_col),
    caract(fort, _, _),
    write("Vous êtes tellement fort, que vous gagnes contre tout ces démons."),
    retract(position_courante(village_col)),
    assert(position_courante(labyrinthe)),
    histoire, !.

attaquer :-
    position_courante(village_col),
    write("Vous êtes pas assez fort, et vous mourrez au combat"), nl,
    write("Vous avez perdu !"), nl,
    fin, !.

attaquer :- % Pour tout les autres cas de attaquer
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

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

non :-
    position_courante(vieil_homme),
    recit,
    retract(position_courante(vieil_homme)),
    assert(position_courante(vieil_homme2)), 
    histoire, !.

non :-
    position_courante(vieil_homme2),
    nl,
    write("Vous n'avez pas le choix, c'est la seul quête des environs, donc vous acceptez."),
    nl,
    retract(position_courante(vieil_homme)),
    assert(position_courante(vieil_homme2)),
    histoire, !.

non :- % Pour tout les autres cas de non
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

oui :-
    position_courante(vieil_homme),
    retract(position_courante(vieil_homme)),
    assert(position_courante(vieil_homme2)),
    histoire, !.

oui :-
    position_courante(vieil_homme2),
    nom_vieil_homme,
    retract(position_courante(vieil_homme2)),
    assert(position_courante(village_col)),
    histoire, !.

oui :- % Pour tout les autres cas de oui
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

rapprocher :-
    position_courante(debut),
    nl,
    write("Vous vous rapprocher du vieil homme"),
    retract(position_courante(debut)),
    assert(position_courante(vieil_homme)),
    nl,
    histoire, !.

rapprocher :- % Pour tout les autres cas de rapprocher
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

revenir :-
    nl,
    write("Vous décider de revenir au château, mais votre professeur (surnommé JCM) vous renvoie la d'ou vous venez."),
    nl,
    options, !.

revenir :- % Pour tout les autres cas de revenir
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Lieux

decrire :-
    position_courante(debut),
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
    nl, !.

options :-
    position_courante(debut),
    nl,
    write("Vous pouvez soit 'continuer', soit vous 'rapprocher' du vieil homme, ou même 'revenir' au château."), nl,
    nl, !.

decrire :-
    position_courante(vieil_homme),
    nl,
    write("En vous rapprochant du vieil homme, vous remarquez qu'il est aveugle. C'est ce même moment qu'il vous dit 'Hey ! Mes"), nl,
    write("yeux ne fonctionnent peut être pas, mais mes oreilles si, je t'entend respirer depuis 20 minutes."), nl,
    write("Intrigué vous ne savez que répondre."), nl,
    write("L'homme commence à raconter son histoire, mais elle ne vous interesse pas, donc vous commencer à partir. Mais il le"), nl,
    write("remarque, non il l'entend et vous interpelle :"), nl,
    write("- Pourquoi tu pars ? Tu ne veux pas d'un bon conseil ?"), nl,
    write("Ce a quoi vous répondez : Tout dépend du type de conseil que vous avez à me prodiguer. L'homme (dont on ne connait"), nl,
    write("toujours pas le nom) vous demande si vous connaissez l'histoire de ce royaume ?"), nl,
    nl, !.

options :-
    position_courante(vieil_homme),
    nl,
    write("'oui' ou 'non' ?"),
    nl,
    nl, !.

decrire :-
    position_courante(vieil_homme2),
    nl,
    write("Aujourd'hui le tunnel est toujours bouché, mais des rumeurs courent sur l'existence d'un second passage dans les "), nl,
    write("montagnes. Dans la partie sud des montagnes bleues des villageois ont vu des démons au loin dans les montagnes, ils "), nl,
    write("pensent qu'ils sont entrain d'amménager un passage au travers des cols."), nl,
    write("Vous cherchiez une quête, en voici une : allez enquêter sur ces apparitions."), nl,
    nl, !.

options :-
    position_courante(vieil_homme2),
    nl,
    write("Acceptez-vous cette quête ? 'oui' ou 'non'."),
    nl,
    nl, !.

decrire :-
    position_courante(village_col),
    nl,
    write("Après un voyage de 2 mois, vous arrivez enfin au village, vide. Mais grâce à votre vue perçante de chevalier, vous "), nl,
    write("pouvez voir de la fumée monter des montagnes."), nl,
    village_colTaille,
    write("Et ce que vous voyez vous consterne. Des centaines de démons creusent un passage de 100 cheveaux de large, il y aurait "), nl,
    write("de quoi faire passer une immense armée."), nl,
    nl, !.

village_colTaille :-
    caract(_, grand, _),
    write("Grâce a vos grandes jambes, vous arrivez très vite en vue du chantier."), nl,
    !.

village_col :-
    write("Puisque vous êtes petit, vous avez besoin de plusieurs heures pour grimper dans la montagne."), nl,
    !.

options :-
    position_courante(village_col),
    nl,
    write("Vous avez le choix, soit vous 'attaquer', soit vous allez au château requérir une 'aide'."),
    nl,
    nl, !.

decrire :-
    position_courante(fin_aide),
    nl,
    write("A l'aide d'un cheval trouvé au village, vous foncez au château alerter le roi. Ce dernier vous remercie, et envoie ses "), nl,
    write("troupes qui écrasent les démons (littéralement, les démons sont minuscules et écrasés par les sabots des destriers)."), nl,
    write("A son retour, le roi vous descerne la plus haute distinction : la médaille du Web, et vous offre la main de sa fille."), nl,
    nl,
    write("Bravo !!! Vous avez gagné."), nl,
    nl,
    fin, !.