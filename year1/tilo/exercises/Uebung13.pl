sigma(a).
sigma(b).
sigma_stern([]).
sigma_stern([A|Ws]):-  sigma_stern(Ws),sigma(A).

lww(Ws) :- sigma_stern(Vs),
           append(Vs,Vs,Ws).
           
lww1(Ws) :- sigma_stern(Ws),
            ersteHälfte(Ws,Vs),
            append(Vs,Vs,Ws).
            
ersteHälfte(Ws,Haelftes) :- length(Ws,N),
                            Nhalbe is N/2,
                            erstenN(Ws,Nhalbe,Haelftes).
erstenN(Ws,0,[]).
erstenN([X|Xs],N,[X|Ys]) :- N>0, N1 is N-1, erstenN(Xs,N1,Ys).

binbaum(empty).
binbaum(node(R,Lb,Rb)) :- binbaum(Lb),binbaum(Rb).

%BFS traversierung
breite(Xb,Ys) :- hilf([Xb],Ys).

hilf([],[]).
hilf([empty|Rs],Ys) :- hilf(Rs,Ys).
hilf([node(Root,Lb,Rb)|Rbs],[Root|Ys]) :- append(Rbs,[Lb,Rb],Restbs),
                                          hilf(Restbs,Ys).
