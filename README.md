# TP3 info501

Kevin Traini

## Question 1

1. `?- chien(milou).` renvoie `true.`
2. `?- mortel(louis_XIV)` renvoie `true.`
3. ->
   1. `?- chien(socrate).` renvoie `false.`
   2. `?- chien(toto)` renvoie `false.`
   3. `?- souris(milou)` renvoie `ERROR: Undefined procedure: souris/1 (DWIM could not correct goal)`
4. `mortel(X)` renvoie `FENZFZE = socrate ; FENZFZE = louis_XIV.`

## Question 2

Les résultat de `X = pere(theophile, louise).` et de `pere(theophile, louise) = X.` sont les mêmes : `X = pere(theopile, louise).`.

## Question 3

Dans les 2 cas (imposer l'égalité, unification implicite), le résultat reste le même : `false.`. En ajoutant la possibilité que le lien entre le grand-père et le petit-fils soit la mère, on corrige le bug.

## Question 4

Pour tout les tests 'normaux' avec 2 constantes, tout fonctionne. Mais quand on mets une variable dans le prédicat fratrie, elle renvoie directement `false.`. Cela est du au fait que prolog vérifie d'abord la première condition, et elle est fausse directement au premier test au la variable est égale à la constante, il faut donc faire ce test en dernier. Et dans ce cas tout fonctionne correctement.

## Question 5

Les 2 manières de définir le prédicat deuxieme fonctionnent, mais la première lève 3 warning pour des variables singleton. Pour la seconde manière, aucun warning n'est levé et elle fonctionne tout aussi bien.

## Question 6

Le prédicat contient fonctionne en 2 temps : il vérifie d'abord, si X est le premier élément de la liste, et dans ce cas il renvoie true, sinon il vérifie récursivement si X est le premier élément du reste de la liste. Les autres prédicats fonctionne de la même manière, on vérifie la condition, si oui on renvoie true, sinon on teste sur le reste de la liste. Petite particularité pour devant, si on a trouvé X, il suffit de tester si le reste de la liste contient Y.

## Question 7

1. `contient1` est la même version du contient de la [question5](#question-5), et le test `contient1(2, L)` offre une magnifique boucle infinie, mais pour le `contient1(X, [1, 2, 3])` on finit sur un false. `contient2` (qui inverse juste l'ordre de déclaration par rapport à `contient1`) enlève le false sur le second test, mais renvoie un 'out of stack' (équivalent à stack overflow) sur le troisième test du au fait que la première déclaration est récursive. `contient3` (qui utilise la coupure) évite la boucle infinie sur le troisième test mais ne montre qu'un seul résultat pour le second, il ne montre à chaque fois qu'un seul résultat. Enfin `contient4` (inverse de `contient3`) fait exactement la même chose que `contient2`.
2. Les versions avec coupure ont l'avantage d'éviter des boucles infinies quand elles sont bien utilisées, mais l'inconvénient de ne montrer qu'un seul résultat lors des requêtes de recherche. Leurs utilisations est donc complexe et il faut bien faire attention à l'ordre dans lequel sont donnés les prédicats.
3. Le prédicat standart `member/2` ne correspond à aucune version ci-dessus : au premier test il renvoie true et false, au second il ne renvoie que les bons résultats sans le false à la fin, et il fait la boucle infinie sur le troisième.

## Question 8

1. Voir fichier **cartes-Traini.pl**.
2. En faisant `solution_as(L).`, prolog nous donne cette solution : `L = [pique, carreau, trefle, coeur] .` qui correspond à la solution trouvée au tp1 :

> Le résultat est l'as de pique en 1, l'as de carreau en 2, l'as de trefle en 3 et l'as de coeur en 4.

## Question 9

1. Voir fichier **zebra-Traini.pl**
2. En faisant `solution(L).`, on obtient cette solution `L = [maison(jaune, poissons, biere, jazz, footballeur), maison(immeuble, hamster, eau, musique_classique, architecte), maison(brique, chat, soda, hard-rock, chercheur), maison(bois, zebre, whisky, chanson_francaise, boulanger), maison(blanche, tortue, the, hiphop, musicien)]`

|  N°   |   Type   |  Animal  | Boisson |      Musique      |   Metier    |
| :---: | :------: | :------: | :-----: | :---------------: | :---------: |
|   1   |  Jaune   | Poissons |  Biere  |       Jazz        | Footballeur |
|   2   | Immeuble | Hamster  |   Eau   | Musique classique | Architecte  |
|   3   |  Brique  |   Chat   |  Soda   |     Hard-rock     |  Chercheur  |
|   4   |   Bois   |  Zebre   | Whisky  | Chanson française |  Boulanger  |
|   5   | Blanche  |  Tortue  |   Thé   |      Hiphop       |  Musicien   |

Ce qui correspond au résultat trouvé au tp1 :
> On en conclut que c'est le boulanger dans la maison 4 qui à le zèbre.

## Question 10

Jouer au jeu, tester la solution, tester les 'bad ending'.

## Question 11

L'histoire principale ainsi que ces potentiels embranchements sont dans le fichier **scenario.md**. Vous y trouverez également les détails du programme.
