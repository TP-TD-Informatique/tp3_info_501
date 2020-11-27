%
% Theophile Eugenie
%    |         |
%    +----+----+
%         |
%    +----+--------------------+-------------------------------+
%    |                         |                               |
% Edith  Pierre             Louise  Francois                Jean-Francois
% |         |                 |         |
% +-------+-+                 +----+----+
%         |                        |
%   +-----+-----------+            |
%   |                 |            |
% Julie Laurent     Thomas    Isabelle   Sebastien
%   |     |                      |           |
%   +--+--+                      +-----+-----+
%      |                               |
%   +--+---------------+               |
%   |                  |               |
%  Lea Leo           Hugo           Kevin   Samanta
%   |    |                             |      |
%   +--+-+                             +------+
%      |                               |      |
%    Gaia                            Téo     Luna
%
:- discontiguous pere/2.
:- discontiguous mere/2.
:- dynamic mere/2.

pere(theophile, edith).
mere(eugenie, edith).
pere(theophile, louise).
mere(eugenie, louise).
pere(theophile, jean_francois).
mere(eugenie, jean_francois).

mere(edith, julie).
pere(pierre, julie).
mere(edith, thomas).
pere(pierre, thomas).

mere(louise, isabelle).
pere(francois, isabelle).

mere(julie, lea).
pere(laurent, lea).
mere(julie, hugo).
pere(laurent, hugo).

mere(isabelle, kevin).
pere(sebastien, kevin).

mere(lea, gaia).
pere(leo, gaia).

mere(samanta, teo).
pere(kevin, teo).

mere(samanta, luna).
pere(kevin, luna).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

grand_pere(X, Y) :-
    pere(X, Z),
    pere(Z, Y).

ancetre(X, Y) :-
    pere(X, Y).
ancetre(X, Y) :-
    mere(X, Y).
ancetre(X, Y) :-
    pere(X, Z),
    ancetre(Z, Y).
ancetre(X, Y) :-
    mere(X, Z),
    ancetre(Z, Y).

fratrie(X,Y) :-
    pere(P, X),
    pere(P, Y).
