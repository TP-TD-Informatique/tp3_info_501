# TP3 info501

Kevin Traini

## Question 1 :

1. `?- chien(milou).` renvoie `true.`
2. `?- mortel(louis_XIV)` renvoie `true.`
3. ->
   1. `?- chien(socrate).` renvoie `false.`
   2. `?- chien(toto)` renvoie `false.`
   3. `?- souris(milou)` renvoie `ERROR: Undefined procedure: souris/1 (DWIM could not correct goal)`
4. `mortel(X)` renvoie `FENZFZE = socrate ; FENZFZE = louis_XIV.`

## Question 2 :

Les résultat de `X = pere(theophile, louise).` et de `pere(theophile, louise) = X.` sont les mêmes : `X = pere(theopile, louise).`.
