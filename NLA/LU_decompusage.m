A = [1,3,2,1 ; 2,2,3,1 ; 1,3,1,2 ; 1,3,3,2];
B = [ 2 2 1 1];

[L, U] = lu_decomposition(A);

Y = fsubst(L,B);
X = bsubst(U,Y);


