% pour montrer qu'un "truc" est mortel, il suffit de montrer que c'est un homme
% Autrement dit "tous les hommes sont mortels"
mortel(X) :- homme(X).

% pour montrer qu'un "truc" est un homme, il suffit de montrer que c'est un philosophe
% Autrement dit "tous les philosophes sont des hommes"
homme(X) :- philosophe(X).

% Louis XIV est un homme
homme(louis_XIV).

% Socrate est un philosophe
philosophe(socrate).

% Milou est un chien !
chien(milou).
