function [ X ] = LDLTrovnice( A , b )

[L,D] = LDLT (A);

Lt = transpose(L);

Z = fsubst(L,b);
Y = DSP(D,Z);
X = bsubst(Lt,Y);

end