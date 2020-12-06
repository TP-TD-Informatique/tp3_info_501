% A la recheche d'une quête
% TP3 info501
% Kevin Traini

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Initialisations de bases
:- retractall(caract(_, _, _)). % Caractéristiques de naissance
:- retractall(position_courante(_)). % On n'est pas né, donc on est nul part
:- retractall(position_labyrinthe(_)). % On n'est pas encore dans le labyrinthe


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
    nl, !.
    
    
% Pour lancer la partie
jouer :-
    naissance.

histoire :-
    decrire,
    options.

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Déplacement
a :-
    position_labyrinthe(q6),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q6)),
    assert(position_labyrinthe(q7)),
    labyrinthe, !.

a :- % Pour tout les autres cas de a
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

afficher :-
    position_labyrinthe(q2),
    nl,
    write("Perdu ! Malheureusement vous êtes mort."),
    nl,
    fin, !.

afficher :- % Pour tout les autres cas de afficher
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

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
    write("Vous êtes tellement fort, que vous gagnez contre tout ces démons."),
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

b :-
    position_labyrinthe(q6),
    nl,
    write("Perdu ! Malheureusement vous êtes mort."),
    nl,
    fin, !.

b :- % Pour tout les autres cas de b
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

c :-
    position_labyrinthe(q9),
    nl,
    write("Je vous souhaite beaucoup de bonheur"),
    nl,
    retract(position_labyrinthe(q9)),
    assert(position_labyrinthe(q8)),
    labyrinthe, !.

c :- % Pour tout les autres cas de c
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

caml :-
    position_labyrinthe(q4),
    nl,
    write("Perdu ! Malheureusement vous êtes mort."),
    nl,
    fin, !.

caml :- % Pour tout les autres cas de caml
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

compile :-
    position_labyrinthe(q1),
    nl,
    write("Bonne réponse !"), 
    nl,
    retract(position_labyrinthe(q1)),
    assert(position_labyrinthe(q2)),
    labyrinthe, !.

compile :- % Pour tout les autres cas de compile
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

continuer :-
    position_courante(desert),
    nl,
    write("Vous trouvez une piste le long de laquelle il y a un puit pour chaque jour. Après 1 semaine de marche vous arrivez "), nl,
    write("en vue du château démon."), nl,
    nl,
    retract(position_courante(desert)),
    assert(position_courante(fin_chateau)),
    histoire, !.

continuer :- % Pour tout les autres cas de continuer
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

excellent :-
    position_labyrinthe(q1),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q1)),
    assert(position_labyrinthe(q4)),
    labyrinthe, !.

excellent :- % Pour tout les autres cas de excellent
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

fil :-
    position_labyrinthe(q8),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q8)),
    retract(position_courante(labyrinthe)),
    assert(position_courante(desert)),
    histoire, !.

fil :- % Pour tout les autres cas de fil
    nl,
    write("Bravo, vous avez trouvé un easter egg, mais il ne sert à rien"),
    nl,
    fail.

graphe :-
    position_labyrinthe(q7),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q7)),
    assert(position_labyrinthe(q9)),
    labyrinthe, !.

graphe :- % Pour tout les autres cas de graphe
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

interprete :-
    position_labyrinthe(q1),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q1)),
    assert(position_labyrinthe(q3)),
    labyrinthe, !.

interprete :- % Pour tout les autres cas de interprete
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

java :-
    position_labyrinthe(q9),
    nl,
    write("Tant pis pour vous"),
    nl,
    retract(position_labyrinthe(q9)),
    assert(position_labyrinthe(q2)),
    labyrinthe, !.

java :- % Pour tout les autres cas de java
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

lif :-
    position_labyrinthe(q8),
    nl,
    write("Mauvaise réponse"),
    nl,
    retract(position_labyrinthe(q8)),
    assert(position_labyrinthe(q5)),
    labyrinthe, !.

lif :- % Pour tout les autres cas de lif
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
    retract(position_courante(vieil_homme2)),
    assert(position_courante(village_col)),
    histoire, !.

non :-
    position_labyrinthe(q3),
    nl,
    write("Mauvaise réponse !"),
    nl,
    retract(position_labyrinthe(q3)),
    assert(position_labyrinthe(q9)),
    labyrinthe, !.

non :- % Pour tout les autres cas de non
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

objet :-
    position_labyrinthe(q7),
    nl,
    write("Perdu ! Malheureusement vous êtes mort !"),
    nl,
    fin, !.

objet :- % Pour tout les autres cas de objet
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

oui :-
    position_labyrinthe(q3),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q3)),
    assert(position_labyrinthe(q8)),
    labyrinthe, !.

oui :- % Pour tout les autres cas de oui
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

println :-
    position_labyrinthe(q2),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q2)),
    assert(position_labyrinthe(q6)),
    labyrinthe, !.

println :- % Pour tout les autres cas de println
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

prolog :-
    position_labyrinthe(q4),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q4)),
    assert(position_labyrinthe(q5)),
    labyrinthe, !.    

prolog :- % Pour tout les autres cas de prolog
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

rebrousser :-
    position_courante(desert),
    nl,
    write("Vous retourner dans la montagne chercher de l'eau dans les glaciers, malheureusement vous tomber dans une crevasse "), nl,
    write("et mourez."), nl,
    nl,
    fin.

rebrousser :- % Pour tout les autres cas de rebrousser
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

v3 :-
    position_labyrinthe(q5),
    nl,
    write("Bonne réponse !"),
    nl,
    retract(position_labyrinthe(q5)),
    assert(position_labyrinthe(q3)),
    labyrinthe, !.

v3 :- % Pour tout les autres cas de v3
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

v5 :-
    position_labyrinthe(q5),
    nl,
    write("Perdu ! Malheureusement vous êtes mort !"),
    nl,
    fin, !.

v5 :- % Pour tout les autres cas de v5
    nl,
    write("Vous ne pouvez pas faire ça !"),
    nl,
    fail.

% _.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-._.-.
% Labyrinthe

labyrinthe :-
    position_labyrinthe(q1),
    nl,
    write("Le python est un langage :"), nl,
    write("   interprete"), nl,
    write("   compile"), nl,
    write("   excellent"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q2),
    nl,
    write("Pour afficher un texte en kotlin, on utilise"), nl,
    write("   println"), nl,
    write("   afficher"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q3),
    nl,
    write("Le noyau linux est open source ?"), nl,
    write("   oui"), nl,
    write("   non"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q4),
    nl,
    write("Le langage utilisé pour ce jeu est :"), nl,
    write("   prolog"), nl,
    write("   caml"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q5),
    nl,
    write("Quelle est la version actuelle de CSS :"), nl,
    write("   v3"), nl,
    write("   v5"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q6),
    nl,
    write("Quel langage n'existe pas"), nl,
    write("   a"), nl,
    write("   b"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q7),
    nl,
    write("noe4j est orienté :"), nl,
    write("   graphe"), nl,
    write("   objet"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q8),
    nl,
    write("La contraction de Fil is a language est :"), nl,
    write("   fil"), nl,
    write("   lif"), nl,
    nl, !.

labyrinthe :-
    position_labyrinthe(q9),
    nl,
    write("Votre langage préféré est :"), nl,
    write("   java"), nl,
    write("   c"), nl,
    nl, !.

labyrinthe :- % Dans tout les autres cas de labyrinthe
    % Ne devrait pas arriver
    nl,
    write("ERREUR"),
    retractall(position_labyrinthe(_)),
    nl, !.

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

decrire :-
    position_courante(vieil_homme),
    nl,
    write("En vous rapprochant du vieil homme, vous remarquez qu'il est aveugle. C'est à ce même moment qu'il vous dit 'Hey ! Mes"), nl,
    write("yeux ne fonctionnent peut être pas, mais mes oreilles si, je t'entend respirer depuis 20 minutes."), nl,
    write("Intrigué vous ne savez que répondre."), nl,
    write("L'homme commence à raconter son histoire, mais elle ne vous interesse pas, donc vous commencer à partir. Mais il le"), nl,
    write("remarque, non il l'entend et vous interpelle :"), nl,
    write("- Pourquoi tu pars ? Tu ne veux pas d'un bon conseil ?"), nl,
    write("Ce a quoi vous répondez : Tout dépend du type de conseil que vous avez à me prodiguer. L'homme (dont on ne connait"), nl,
    write("toujours pas le nom) vous demande si vous connaissez l'histoire de ce royaume ?"), nl,
    nl, !.

decrire :-
    position_courante(vieil_homme2),
    nl,
    write("Aujourd'hui le tunnel est toujours bouché, mais des rumeurs courent sur l'existence d'un second passage dans les "), nl,
    write("montagnes. Dans la partie sud des montagnes bleues des villageois ont vu des démons au loin dans les montagnes, ils "), nl,
    write("pensent qu'ils sont entrain d'amménager un passage au travers des cols."), nl,
    write("Vous cherchiez une quête, en voici une : allez enquêter sur ces apparitions."), nl,
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

decrire :-
    position_courante(labyrinthe),
    nl,
    write("Vous arrivez enfin au labyrinthe, pour le traverser vous devrez répondre à une série de questions. Faite attention, car "), nl,
    write("une mauvaise réponse pourrais signer votre fin."), nl,
    nl,
    nl, !.

decrire :-
    position_courante(desert),
    nl,
    write("Enfin ! Vous avez réussi les épreuves du labyrinthe. Maintenant vous êtes dans le désert, et vous n'avez pas d'eau."), nl,
    nl,
    nl, !.

decrire :-
    position_courante(fin_chateau),
    nl,
    write("Quand vous arrivez au pied du château, le nouveau roi des démons vous attend. En tant que chevalier et défenseur de la "), nl,
    write("liberté de programmation, vous le provoquer en duel."), nl,
    chateau_idiot,
    fin.

options :-
    position_courante(debut),
    nl,
    write("Vous pouvez soit 'continuer', soit vous 'rapprocher' du vieil homme, ou même 'revenir' au château."), nl,
    nl, !.

options :-
    position_courante(vieil_homme),
    nl,
    write("'oui' ou 'non' ?"),
    nl,
    nl, !.

options :-
    position_courante(vieil_homme2),
    nl,
    write("Acceptez-vous cette quête ? 'oui' ou 'non'."),
    nl,
    nl, !.

options :-
    position_courante(village_col),
    nl,
    write("Vous avez le choix, soit vous 'attaquer', soit vous allez au château requérir une 'aide'."),
    nl,
    nl, !.

options :-
    position_courante(labyrinthe),
    assert(position_labyrinthe(q1)),
    labyrinthe, !.

options :-
    position_courante(desert),
    nl,
    write("Que faites vous ? 'rebrousser' chemin pour aller chercher de l'eau, ou 'continuer' en espérant tomber sur des puits."), nl,
    nl,
    nl, !.

village_colTaille :-
    caract(_, grand, _),
    write("Grâce a vos grandes jambes, vous arrivez très vite en vue du chantier."),
    nl, !.

village_colTaille :-
    write("Puisque vous êtes petit, vous avez besoin de plusieurs heures pour grimper dans la montagne."),
    nl, !.

chateau_idiot :-
    position_courante(fin_chateau),
    caract(_, _, idiot),
    nl,
    write("Du fait de votre non-intelligence, vous attaquez instinctivement et réussissez à battre le roi de démons."), nl,
    nl,
    write("Bravo !!! Vous avez gagné !"), nl,
    nl, !.

chateau_idiot :-
    position_courante(fin_chateau),
    nl,
    write("Vous réflechissez trop à votre tactique, et le roi des démons vous détruit littéralement."), nl,
    nl,
    write("Vous être mort !"), nl,
    nl, !.