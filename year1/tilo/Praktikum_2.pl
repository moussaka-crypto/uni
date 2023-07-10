
elternteil(rene,julian).
elternteil(rene,elias).
elternteil(lilli,julian) .
elternteil(lilli,elias).
elternteil(josif,rene).
elternteil(josif,monica).
elternteil(josif,dan).
elternteil(dan,bulu).
elternteil(dan,martha).

m‰nnlich(rene).
m‰nnlich(julian).
m‰nnlich(elias).
m‰nnlich(josif).
m‰nnlich(bulu).
m‰nnlich(dan).
weiblich(lilli).
weiblich(monica).
weiblich(martha).


% X ist Vater von Y.
vater(X,Y):- m‰nnlich(X), elternteil(X,Y).

% X ist Mutter von Y.
mutter(X,Y):- weiblich(X), elternteil(X,Y).

% X ist Sohn von Y.
sohn(X,Y):- m‰nnlich(X), elternteil(Y,X).

% X ist Tochter von Y.
tochter(X,Y):- weiblich(X), elternteil(Y,X).

% X ist Bruder von Y.
bruder(X,Y):- m‰nnlich(X), vater(V,X), vater(V,Y),mutter(M,X), mutter(M,Y), X\=Y.
%bruder(X,Y):- m‰nnlich(X), elternteil(E,X), elternteil(E,Y),X\=Y.

% X ist Schwester von Y.
schwester(X,Y):- weiblich(X), vater(V,X), vater(V,Y),mutter(M,X), mutter(M,Y), X\=Y.

% X ist Kind von Y.
kind(X,Y):- elternteil(Y,X).

% X ist zu Y verheiratet.
% normalerweise als Fakt definieren?
verheiratet(X,Y):- vater(X,K),mutter(Y,K).

% X ist Onkel von Y.
onkel(X,Y):- elternteil(E,Y), bruder(X,E).
%onkel(X,Y):- m‰nnlich(X), elternteil(P,Y), schwester(S,P), verheiratet(S,X).

% X ist Tante von Y.
tante(X,Y):- elternteil(E,Y),schwester(X,E).
%tante(X,Y):- weiblich(X), elternteil(P,Y), bruder(B,P), verheiratet(B,X).

% X ist Cousine von Y.
cousine(X,Y):- weiblich(X), elternteil(E1,X), elternteil(E2,Y), bruder(E1,E2).
cousine(X,Y):- weiblich(X), elternteil(E1,X), elternteil(E2,Y), schwester(E1,E2).

% X ist Cousin von Y.
cousin(X,Y):- m‰nnlich(X), elternteil(E1,X), elternteil(E2,Y), bruder(E1,E2).
cousin(X,Y):- m‰nnlich(X), elternteil(E1,X), elternteil(E2,Y), schwester(E1,E2).

% X ist Groﬂvater von Y.
groﬂvater(X,Y):- vater(X,S), elternteil(S,Y).

% X ist Groﬂmutter von Y.
groﬂmutter(X,Y):- mutter(X,S), elternteil(S,Y).

% X ist Schwager von Y.
schwager(X,Y):- verheiratet(Y,P), bruder(X,P).
schwager(X,Y):- schwester(S,Y), verheiratet(X,S).
schwager(X,Y):- verheiratet(P,Y), schwester(S,P), verheiratet(X,S).

% X ist Schw‰gerin von Y.
schw‰gerin(X,Y):- verheiratet(Y,P), schwester(X,P).
schw‰gerin(X,Y):- bruder(B,Y), verheiratet(X,B).
schw‰gerin(X,Y):- verheiratet(P,Y), bruder(B,P), verheiratet(X,B).

% X ist Schwiegermutter von Y.
schwiegermutter(X,Y):- weiblich(X), verheiratet(K,Y), elternteil(X,K).

% X ist Schwiegervater von Y.
schwiegervater(X,Y):- m‰nnlich(X), verheiratet(K,Y), elternteil(X,K).

% X ist Vorfahre von Y.
vorfahre(X,Y):- elternteil(X,Y).
vorfahre(X,Y):- elternteil(E,Y),vorfahre(X,E).

% X ist Nachkomme von Y.
nachkomme(X,Y):- elternteil(Y,X).
nachkomme(X,Y):- elternteil(I,X), nachkomme(I,Y).
