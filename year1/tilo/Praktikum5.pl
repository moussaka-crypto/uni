%Zustandsmenge
state(s).
state(i1).
state(a).
state(i2).

%Start und Endmenge
start(s).
end(a).
end(i2).

%Alphabet
sigma(tick).
sigma(tack).

%Transitionsfunktion
delta(s,tick,i1).
delta(i1,tack,a).
delta(a,tick,i2).
delta(i2,tack,a).

%///////////////////////////////////////////// allgemein

% Sigma* - alle gültige Wörter
sigma_stern([]).
sigma_stern([A|Ws]):-sigma_stern(Ws),sigma(A).

%Delta*
delta_stern(S,[],S).
delta_stern(S,[A|Ws],S1):-delta(S,A,S2),delta_stern(S2,Ws,S1).

lvonN(Ws):-sigma_stern(Ws),start(S),end(E),delta_stern(S,Ws,E).
