%A45

l_uhr([tick|V1]):- v1(V1).
v1([tack]).
v1([tack|V2]):-v2(V2).
v2([tick]).
v2([tick|V1]):-v1(V1).


%A49

%rS([]).
%rS([a]).
%rs([a|As]):-rA(As).
%rA([a]).
%rA([a|Bs]):-rB(Bs).

rS([0|As]):- rA(As).
rA([1]).
rS([0|Ss]):- rS(Ss).
rS([1|Ss]):- rS(Ss).
rB([0|As]):- rA(As).
rB([0|Ss]):- rS(Ss).
rB([1|Ss]):- rS(Ss).
