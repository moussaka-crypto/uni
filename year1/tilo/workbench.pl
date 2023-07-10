subliste(Xs,Ys) :- app(H2s,H3s,Ys),app(H1s,Xs,H2s).

lm([X|Xs],X):-length(Xs,N), 1 is N mod 2.
lm(Xs,X):-length(Xs,N),1 is N mod 2, mid(Xs,X).
mid(Xs,X):-append(Ls,[X|Rs],Xs),length(Ls,L),length(Rs,L).

len3([]).
len3([A,B,C|Rs]):-len3(Rs).

elemAt([X|Rs],1,X).
elemAt([Y|Rs],N,X):-N>1,N1 is N-1, elemAt(Rs,N1,X).
extract(Ls,X,Y,[XP,YP]):- elemAt(Ls,X,XP),elemAt(Ls,Y,YP).
