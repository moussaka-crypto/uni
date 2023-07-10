% A59

variable(vS).
sigma(a).
sigma(b).
start(vS).
regeln([vS],[]).
regeln([vS],[a,b]).
regeln([vS],[a,vS,b]).

sig(a).
sig(b).
sigstern([]).
sigstern([A|Ws]):- sig(A),sigstern(Ws).

sigma_ab(a).
sigma_ab(b).
sigmaab_stern([]).
sigmaab_stern([A|Ws]):-sigmaab_stern(Ws),sigma_ab(A).
sigmabin(0).
sigmabin(1).
sigmabinstern([]).
sigmabinstern([A|Ws]) :- sigmabinstern(Ws),sigmabin(A).

lger(Ws):- sigmaab_stern(Ws),length(Ws,L),0 is L mod 2.
lend01(Ws):- append(Xs,[0,1],Ws),sigmabinstern(Ws), sigmabinstern(Xs) .
lpalinbin(Ws) :- sigmabinstern(Ws),reverse(Ws,Ws).
lpalinlat(Ws):-reverse(Ws,Ws).

% A62 - Hinweis f�r A65
%rs([]).
%rs([a|Wb]):- rs(W), append(W,[b],Wb).

%A65
rS(Ws) :-
rA(As), append([a,b,c],As,H1s), append(H1s,[d,e],H2s),
rB(Bs), append(H2s,Bs,H3s), append(H3s,[f,g],H4s),
rC(Cs), append(H4s,C,H5s), append(H5s,[h,i,j],Ws).
