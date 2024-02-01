% A62 - Hinweis f�r A65
%rs([]).
%rs([a|Wb]):- rs(W), append(W,[b],Wb).

%A65
rS(Ws) :-rA(As), append([a,b,c],As,H1s), append(H1s,[d,e],H2s),
rB(Bs), append(H2s,Bs,H3s), append(H3s,[f,g],H4s),
rC(Cs), append(H4s,C,H5s), append(H5s,[h,i,j],Ws).
