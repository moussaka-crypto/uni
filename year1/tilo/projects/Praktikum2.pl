
parent(rene,julian).
parent(rene,elias).
parent(lilli,julian) .
parent(lilli,elias).
parent(josif,rene).
parent(josif,monica).
parent(josif,dan).
parent(dan,bulu).
parent(dan,martha).

male(rene).
male(julian).
male(elias).
male(josif).
male(bulu).
male(dan).
female(lilli).
female(monica).
female(martha).


% X ist Vater von Y.
vater(X,Y):- male(X), parent(X,Y).

% X ist Mutter von Y.
mutter(X,Y):- female(X), parent(X,Y).

% X ist Sohn von Y.
sohn(X,Y):- male(X), parent(Y,X).

% X ist Tochter von Y.
tochter(X,Y):- female(X), parent(Y,X).

% X ist Bruder von Y.
bruder(X,Y):- male(X), vater(V,X), vater(V,Y),mutter(M,X), mutter(M,Y), X\=Y.
%bruder(X,Y):- male(X), parent(E,X), parent(E,Y),X\=Y.

% X ist Schwester von Y.
schwester(X,Y):- female(X), vater(V,X), vater(V,Y),mutter(M,X), mutter(M,Y), X\=Y.

% X ist Kind von Y.
kind(X,Y):- parent(Y,X).

% X ist zu Y verheiratet.
% normalerweise als Fakt definieren?
verheiratet(X,Y):- vater(X,K),mutter(Y,K).

% X ist Onkel von Y.
onkel(X,Y):- parent(E,Y), bruder(X,E).
%onkel(X,Y):- male(X), parent(P,Y), schwester(S,P), verheiratet(S,X).

% X ist Tante von Y.
tante(X,Y):- parent(E,Y),schwester(X,E).
%tante(X,Y):- female(X), parent(P,Y), bruder(B,P), verheiratet(B,X).

% X ist Cousine von Y.
cousine(X,Y):- female(X), parent(E1,X), parent(E2,Y), bruder(E1,E2).
cousine(X,Y):- female(X), parent(E1,X), parent(E2,Y), schwester(E1,E2).

% X ist Cousin von Y.
cousin(X,Y):- male(X), parent(E1,X), parent(E2,Y), bruder(E1,E2).
cousin(X,Y):- male(X), parent(E1,X), parent(E2,Y), schwester(E1,E2).

% X ist Gro�vater von Y.
gro�vater(X,Y):- vater(X,S), parent(S,Y).

% X ist Gro�mutter von Y.
gro�mutter(X,Y):- mutter(X,S), parent(S,Y).

% X ist Schwager von Y.
schwager(X,Y):- verheiratet(Y,P), bruder(X,P).
schwager(X,Y):- schwester(S,Y), verheiratet(X,S).
schwager(X,Y):- verheiratet(P,Y), schwester(S,P), verheiratet(X,S).

% X ist Schw�gerin von Y.
schw�gerin(X,Y):- verheiratet(Y,P), schwester(X,P).
schw�gerin(X,Y):- bruder(B,Y), verheiratet(X,B).
schw�gerin(X,Y):- verheiratet(P,Y), bruder(B,P), verheiratet(X,B).

% X ist Schwiegermutter von Y.
schwiegermutter(X,Y):- female(X), verheiratet(K,Y), parent(X,K).

% X ist Schwiegervater von Y.
schwiegervater(X,Y):- male(X), verheiratet(K,Y), parent(X,K).

% X ist Vorfahre von Y.
vorfahre(X,Y):- parent(X,Y).
vorfahre(X,Y):- parent(E,Y),vorfahre(X,E).

% X ist Nachkomme von Y.
nachkomme(X,Y):- parent(Y,X).
nachkomme(X,Y):- parent(I,X), nachkomme(I,Y).
