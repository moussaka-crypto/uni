start(z0).
stackEnd(#).

state(z0).
state(z1).

sigma(0).
sigma(1).
sigma_stern([]).
sigma_stern([A|Ws]) :- sigma_stern(Ws),sigma(A).

gamma(0).
gamma(1).
gamma(#).
gamma_stern([]).
gamma_stern([A|Ws]) :- gamma_stern(Ws),gamma(A).

%1. Hälfte
delta(z0, 0, #, z0, [0, #]).
delta(z0, 0, 1, z0, [0, 1]).
delta(z0, 0, 0, z0, [0, 0]).
delta(z0, 1, #, z0, [1, #]).
delta(z0, 1, 1, z0, [1, 1]).
delta(z0, 1, 0, z0, [1, 0]).

% ung. Pal. Symbol lesen, aber nicht auf Stack setzen
delta(z0, 1, #, z1, [#]).
delta(z0, 1, 1, z1, [1]).
delta(z0, 1, 0, z1, [0]).
delta(z0, 0, #, z1, [#]).
delta(z0, 0, 1, z1, [1]).
delta(z0, 0, 0, z1, [0]).

%Transition 2. Hälfte (all pals)
delta(z0, nix, #, z1, [#]).
delta(z0, nix, 1, z1, [1]).
delta(z0, nix, 0, z1, [0]).

%Transition 2. Hälfte (odd pals)
%delta(z1, nix, #, z2, [#]).
%delta(z1, nix, 1, z2, [1]).
%delta(z1, nix, 0, z2, [0]).

%2. Hälfte
delta(z1, 0, 0, z1, []).
delta(z1, 1, 1, z1, []).
delta(z1, nix, #, z1, []).

%///////////////////////////////////////////// allgemein

es(S,[A|Ws],[G|Ss], NewS, Ws, NewSs):-state(S),state(NewS),
                                    sigma(A),sigma_stern(Ws),
                                    gamma(G),gamma_stern(Ss),
                                    delta(S, A, G, NewS, TmpSs),
                                    append(TmpSs, Ss, NewSs).

es(S, Ws, [G|Ss], NewS, Ws, NewSs):-state(S),state(NewS),
                                    sigma_stern(Ws),
                                    gamma(G),gamma_stern(Ss),
                                    delta(S, nix, G, NewS, TmpSs),
                                    append(TmpSs, Ss, NewSs).

% Erweiterung
es_plus(S, W1s, S1s, NewS, W2s, S2s) :- es(S, W1s, S1s, NewS, W2s, S2s).
es_plus(S, W1s, S1s, NewS, W2s, S2s) :- es(S, W1s, S1s, S2, W3s, S3s),
                                        es_plus(S2, W3s, S3s, NewS, W2s, S2s).

%es_stern(S, W1s, S1s, NewS, W2s, S2s).
%es_stern(S, W1s, S1s, NewS, W2s, S2s):-es(S, W1s, S1s, S2, W3s, S3s),
%                                       es_stern(S2, W3s, S3s, NewS, W2s, S2s).


% L(M) : Die vom PDA erkannte Sprache
lvonM(Ws) :- sigma_stern(Ws), state(NewS),
             es_plus(z0, Ws, [#], NewS, [], []).

