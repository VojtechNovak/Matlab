A = [1 -1 2;-1 5 -4; 2 -4 6]
n = size(A);
b = -ones(n,1);

L = cholesky(A);

y=L\b; x=L\y; 