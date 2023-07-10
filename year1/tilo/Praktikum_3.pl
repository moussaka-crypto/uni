%Aufgabe 1 --------------------------------------------------------------------

% linListe(Xs): Xs ist eine gueltige Liste, wenn Var gueltige Listen ausgeben
linListe(nil).
linListe(list(X,Xs)) :- linListe(Xs).

% app(Xs,Ys,Rs): Xs+Ys = Rs.
app(nil,Ys,Ys):-linListe(Ys).
app(list(X,Xs),Ys,list(X,Rs)):- app(Xs,Ys,Rs),linListe(Xs), linListe(Ys),
                                                            linListe(Rs).

%member2(X,list(X,nil)).
%member2(X, list(X,Rs)):- linListe(Rs).
%member2(X, list(Y,Ys)) :- member2(X,Ys), linListe(Ys).
%infix(nil,Rs).
%infix(list(B,Es),Ls):-infix(Es,Ls),member2(B,Ls).
%member2(X,Ys):- app(R1s,R2s,Ys),app(Xs,list(X,nil),R1s), linListe(Ys).

%member2(X,Ys) : Liste Ys enthält das Element X.
member2(X,Ys):- app(H1s,list(X,Rs),Ys), linListe(Ys).

%infix(Xs,Ys) : Liste Ys enthält die Liste Xs.
infix(Xs,Ys):- app(Rs,H2s,Ys), app(H1s,Xs,Rs).

%attach(Xs,X,Ys) : Liste Ys ist die Liste Xs verlängert um das Element X.
% Xs+X = Ys.
attach(Xs,X,Ys):- app(Xs,list(X,nil),Ys), linListe(Xs), linListe(Ys).

%rev(Xs,Ys) : Liste Ys ist die gespiegelte Liste Xs.
rev(nil,nil).
rev(list(X,Xs),Ys):- rev(Xs,Rs),attach(Rs,X,Ys), linListe(Xs), linListe(Ys).

%Aufgabe 2---------------------------------------------------------------------

add(o,X,X).
add(s(X),Y,s(R)) :- add(X,Y,R),natSymb(X),natSymb(Y),natSymb(R).
natSymb(o).
natSymb(s(X)) :- natSymb(X).

% binbaum(Xb) - ein gueltiger BinBaum
binbaum(empty).
binbaum(node(R,Lb,Rb)) :- binbaum(Lb),binbaum(Rb).

%construct(Root,Lb,Rb,Xneub) : Xneub ist der Baum mit Wurzel Root,
%                            - linkem Teilbaum Lb und - rechtem Teilbaum Rb.

%construct(R,empty,empty,R).
construct(Root,Lb,Rb,node(Root,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

%knotenanz(Xb,N) : N (natSymb) ist die Anzahl der Knoten des Baumes Xb.
knotenanz(empty,o).
knotenanz(node(R,Lb,Rb),s(N)):-knotenanz(Lb,N1), knotenanz(Rb,N2),add(N1,N2,N).

