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

Pour tout les tests 'normaux' avec 2 constantes, tout fonctionne. Mais quand on mets une variable dans fratrie, elle renvoie directement `false.`. Cela est du au fait que prolog vérifie d'abord la première condition, et elle est fausse directement au premier test au la variable est égale à la constante, il faut donc faire ce test en dernier. Et dans ce cas tout fonctionne correctement.
