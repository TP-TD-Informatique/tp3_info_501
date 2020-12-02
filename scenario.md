# A la recherche d'une quête

Le programme du jeu se trouve dans le fichier **recherche_quete.pl**

Au lancement du jeu, quelques questions sont posées, et elles permettent de définir les caractéristiques du personnage.

## Sommaire

- [Sommaire](#sommaire)
- [Histoire](#histoire)
  - [Naissance](#naissance)
  - [Début](#début)
  - [Vieil homme](#vieil-homme)
  - [Recit](#recit)
  - [Vieil homme 2](#vieil-homme-2)
  - [Vieil homme 3](#vieil-homme-3)
  - [Village col](#village-col)
  - [Fin aide](#fin-aide)

## Histoire

Les textes sont dans les blocks, la dynamique est marqué juste après.

### Naissance

```md
En l'an de grâce .... En fait je sais pas quand est-ce que vous êtes né. Bref, quand vous êtes né, vous avez du faire des choix, comme tout le monde :

1. Devenir fort avec peu de résistance ('fort'), ou faible avec beaucoup de résistance ('faible').
2. Etre grand ou petit.
3. Etre intelligent ou idiot.

Pour faire votre choix faites : choix(force, taille, intelligence).
```

---

### Début

```md
A une certaine époque, dans un certain lieu, le royaume d'Hediata profite d'une paix qui dure depuis des siècles avec le royaume voisin des démons.
Vous êtes un jeune chevalier qui vient d'obtenir sa licence, et pour entrer en master vos professeur vous demande de réaliser une quête. Ils vous en proposent même plusieurs :

- le Graal
- la grande question de la vie
- ...

Mais vous les refusez toutes, vous les trouvez trop faciles, vous partez donc en balade dans la forêt partiellement magique à la recherche d'une princesse en détresse (vous êtes chevalier après tout).

Au bout d'a peine 10 heures de marche, vous croisez une première personnes, il s'agit d'un vieil homme assis sur le bord du chemin, il a un bâton dans la main gauche.

Vous pouvez soit 'continuer', soit vous 'rapprocher' du vieil homme, ou même 'revenir' au château.
```

- continuer ->
  - `Vous continuer de marcher indéfiniment jusqu'à votre mort. Vous avez perdu !`
  - fin du jeu.
- rapprocher ->
  - `Vous vous rapprocher du vieil homme`
  - position_courante(vieil_homme)
  - histoire
- revenir ->
  - `Vous décider de revenir au château, mais votre professeur (surnommé JCM) vous renvoie la d'ou vous venez.`
  - reste à la position courante
  - rappel des choix.

---

### Vieil homme

```md
En vous rapprochant du vieil homme, vous remarquez qu'il est aveugle. C'est ce même moment qu'il vous dit 'Hey ! Mes yeux ne fonctionnent peut être pas, mais mes oreilles si, je t'entend respirer depuis 20 minutes.
Intrigué vous ne savez que répondre.
L'homme commence à raconter son histoire, mais elle ne vous interesse pas, donc vous commencer à partir. Mais il le remarque, non il l'entend et vous interpelle :

- Pourquoi tu pars ? Tu ne veux pas d'un bon conseil ?

Ce a quoi vous répondez : Tout dépend du type de conseil que vous avez à me prodiguer. L'homme (dont on ne connait toujours pas le nom) vous demande si vous connaissez l'histoire de ce royaume ?

'oui' ou 'non' ?
```

- non ->
  - raconter l'histoire
  - position_courante(vieil_homme2)
- oui ->
  - position_courante(vieil_homme2)

### Recit

```md
Tout commence il y a plusieurs années, notre royaume vivait en paix, le commerce prosperait, tout le monde était heureux. Jusqu'au jour ou le roi des démons traversa les montagnes bleues en ammenant la guerre. Celle-ci dura pendant 5 rois humains, et toujours le roi des démons nous attaquait. Quand un jour, le jeune roi Sir Wayntal premier du nom décida de jeter toutes nos forces dans la traversée du tunnel.
La bataille du tunnel dura 3 jours. 3 jours durant lesquels les pertes furent nombreuses, côté humains, mais surtout côté démons. Quand cette bataille fut gagnée notre roi à la tête des troupes investit les marais et se retrouva 1 semaine plus tard au pied du château démon qu'il assiega. C'était la première fois qu'on voyait cette batisse : entièrement noire, elle était immense et semblait impénétrable. Mais au bout de 3 mois de siège les défense céderent et au cours d'une ultime bataille (que l'on nomma plus tard la bataille du Java), notre roi tua le roi des démons. Le château fut incendié et nos troupes revinrent au pays, en condamnant le tunnel.
```

### Vieil homme 2

```md
Aujourd'hui le tunnel est toujours bouché, mais des rumeurs courent sur l'existence d'un second passage dans les montagnes. Dans la partie sud des montagnes bleues des villageois ont vu des démons au loin dans les montagnes, ils pensent qu'ils sont entrain d'amménager un passage au travers des cols.
Vous cherchiez une quête, en voici une : allez enquêter sur ces apparitions.

Acceptez-vous cette quête ? 'oui' ou 'non'.
```

- oui ->
  - nom vieil homme
  - position_courante(village_col)
- non ->
  - `Vous n'avez pas le choix, c'est la seul quête des environs, donc vous acceptez`
  - position_coutante(village_col)

### Vieil homme 3

```md
Le vieil homme, content de vous, accepte de vous dire son nom : il s'agit du baron Cavallini, celui dont les terres s'étendent du nord des montagnes jusqu'à l'océan.
```

### Village col

```md
Après un voyage de 2 mois, vous arrivez enfin au village, vide. Mais grâce à votre vue perçante de chevalier, vous pouvez voir de la fumée monter des montagnes.
```

Si grand

```md
Grâce a vos grandes jambes, vous arrivez très vite en vue du chantier.
```

Sinon

```md
Puisque vous êtes petit, vous avez besoin de plusieurs heures pour grimper dans la montagne.
```

```md
Et ce que vous voyez vous consterne. Des centaines de démons creusent un passage de 100 cheveaux de large, il y aurait de quoi faire passer une immense armée.

Vous avez le choix, soit vous 'attaquer', soit vous allez au château requérir une 'aide'.
```

- attaquer ->
  - Si fort : gagne -> position_courante(labyrinthe),
  - Si faible : mort -> fin du jeu
- aide ->
  - position_courante(fin_aide)

### Fin aide

```md
A l'aide d'un cheval trouvé au village, vous foncez au château alerter le roi. Ce dernier vous remercie, et envoie ses troupes qui écrasent les démons (littéralement, les démons sont minuscules et écrasés par les sabots des destriers).
A son retour, le roi vous descerne la plus haute distinction : la médaille du Web, et vous offre la main de sa fille.


Bravo !!! Vous avez gagné.
```

fin du jeu

### Labyrinthe
