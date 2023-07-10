const(a). variable(vX).
const(b). variable(vY).
const(c). variable(vZ).

tree(X) :- const(X).
tree(X) :- variable(X).
tree(f(T1,T2)) :- tree(T1), tree(T2).
tree(g(T)) :- tree(T).
tree(h(T1,T2,T3)) :- tree(T1),tree(T2),tree(T3).
natSymb(o).
natSymb(s(X)) :- natSymb(X).

%Hilfspakete - A27
%lessequ(X,Y) : X ist kleiner gleich Y.
lessequ(o,X).
lessequ(s(X),s(Y)) :- lessequ(X,Y).

%maxi(X,Y,M): M ist das Maximum von X und Y.
maxi(X,Y,X):- lessequ(Y,X).
maxi(X,Y,Y) :- lessequ(X,Y).

add(o,X,X).
add(s(X),Y,s(Z)):- add(X,Y,Z).

%height(T,N) : N ist die Höhe von T.
height(T,o):- const(T).
height(T,o):- variable(T).

height(g(T),s(N)):- height(T,N).
height(f(T1,T2),s(Nmax)):-height(T1,N1), height(T2,N2), maxi(N1,N2,Nmax).

height(h(T1,T2,T3),s(Nmax)):- height(T1,N1), height(T2,N2), height(T3,N3),
                           maxi(N1,N2,Ntmp), maxi(Ntmp,N3,Nmax).
                           
%functs(T,N) : N ist die Anzahl der Funkt. in T.
functs(T,o):-variable(T).
functs(T,o):-const(T).
functs(g(T),s(N)):-functs(T,N). % s(N) wegen Wurzelknoten
functs(f(T1,T2),s(Nall)):-functs(T1,N1),functs(T2,N2),add(N1,N2,Nall).
functs(h(T1,T2,T3),s(Nall)):- functs(T1,N1),functs(T2,N2), functs(T3,N3),
                          add(N1,N2,Ntmp), add(Ntmp,N3,Nall).

%varcons(T,N) : N ist die Anzahl der Vars und Const in T.
varcons(T,s(o)):-const(T).
varcons(T,s(o)):-variable(T).
% nur const varcons(T,o):-variable(T).
varcons(g(T),s(N)):-varcons(T,N).
varcons(f(T1,T2),s(N)):-varcons(T1,N1),varcons(T2,N2), add(N1,N2,N).
varcons(h(T1,T2,T3), Nall):- varcons(T1,N1),varcons(T2,N2),varcons(T3,N3),
                            add(N1,N2,Ntmp), add(Ntmp,N3,Nall).
                            
%A28
selectU(X,[X|Xs],Xs).
selectU(X,[Y|Xs],[Y|Rs]):-selectU(X,Xs,Rs).

sel1(Xs,Ys):- append(Ls,[X|Rs],Xs), append(Ls,Rs,Ys).

insert(X,Ys,Rs):-selectU(X,Rs,Ys). %einfach Argumente umtauschen

perm_s([],[]).
perm_s(Xs,[Y|Ys]):- selectU(Y,Xs,Rs),perm_s(Rs,Ys).

perm_i([],[]).
perm_i([X|Xs],X1s):-perm_i(Xs,Ys), insert(X,Ys,X1s).


%A44
sigma(a).
sigma(b). % Elemente durch Fakten

% Woerter als Listen mit beliebiger Anzahl von Elementen aus sigma
% [a,b,b,a]
% [a,a,b,b,a]
% [b,a,b,a]

% Sprache - Menge von Woertern ueber sigma
% {ab,aa,bb,ba} - als Liste jedes Wort vorstellen

%liste([a,b]).
%liste([a,a]).
%liste([b,b]).
%liste([b,a]).

sigma_stern([]).
sigma_stern([A|Ws]):- sigma_stern(Ws), sigma(A).


