präfix(Xs,Ys):-append(Xs,Rs,Ys).
praefix([],Ys).
praefix([X|Xs],[X|Ys]):-praefix(Xs,Ys).

%postfix(Xs,Ys) : Liste Ys endet mit der Liste Xs.
postfix(Xs,Ys):- reverse(Ys,RYs),praefix(RXs,RYs),reverse(Xs,RXs).
postfixapp(Xs,Ys):-append(Rs,Xs,Ys).

binbaum(empty).
binbaum(node(R,Lb,Rb)) :- binbaum(Lb),binbaum(Rb).

%membertree(X,Xb) : Baum Xb enthält den Eintrag X.
membertree(X,node(X,Lb,Rb)).
membertree(X,node(R,Lb,Rb)):-membertree(X,Lb).
membertree(X,node(R,Lb,Rb)):-membertree(X,Rb).

%präorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen
%              des Binärbaumes Xb in Präorder.
% WLR
präorder(empty,[]).
präorder(node(X,Lb,Rb),[X|Ys]):-präorder(Lb,YLs), präorder(Rb,YRs),
                                                  append(YLs,YRs,Ys).
%postorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen
%                   des Binärbaumes Xb in Postorder.
% LRW
postorder(empty,[]).
postorder(node(X,Lb,Rb),Ys):- postorder(Lb,YLs), postorder(Rb,YRs),
                              append(YLs,YRs,Xs), append(Xs,[X],Ys).

%inorder(Xb,Ys) : Ys ist die Liste der Knotenbeschriftungen
%                   des Binärbaumes Xb in Inorder.
% LWR
inorder(empty,[]).
inorder(node(X,Lb,Rb),Ys):-inorder(Lb,Ls),inorder(Rb,Rs),
                                       append(Ls,[X|Rs],Ys).

%roots(Xbs,Ys): Xbs ist eine Liste von Binärbäumen
%               und Ys ist die Liste der Wurzel.
roots([],[]).
roots([empty|Xbs],Ys):-roots(Xbs,Ys).
roots([node(X,Lb,Rb)|Xbs],[X|Ys]):-roots(Xbs,Ys).
