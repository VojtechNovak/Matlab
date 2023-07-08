A = [1,2,5,3,8;1,1,9,6,2;5,9,1,4,6;3,6,4,1,7;8,2,6,7,1];
b = [7;7;5;5;6];

x1_Matlab = A\b;

g = det(A);

[ L, D ] = my_ldlt( A );

Z = fsubst(L,b);
Y = DSP(D,Z);
X = bsubst(L',Y);
