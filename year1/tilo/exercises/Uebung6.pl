% A16

%mirror(X,Y) : X ist der Baum und Y die Spiegelung an der Mittelachse
mirror(leer,leer).
mirror(node(W,Lb,Rb),node(W,Lmb,Rmb)):- mirror(Lb,Lmb), mirror(Rb,Rmb).
