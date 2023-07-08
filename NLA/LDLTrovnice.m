function [ X ] = LDLTrovnice( A , b )
% vyresi soustavu Ax = b
% jako Lz = b   =>  z = b/L ,  y = z/D   , x = y/L'
% kde A je rozlozena na dolni trojuhelnikovou matici L
% horni trojuhelnikovou matici L' a matici s prvky na diagonale D

% vysledek je sloupcovy vektor X, kde x1 = X(1,1) , x2 = X(2,1) ...

[L,D] = LDLT (A);

Z = fsubst(L,b);
Y = DSP(D,Z);
X = bsubst(L',Y);

end