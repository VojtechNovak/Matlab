function [ L, U ] = lu_decomposition( A )
%LU_DECOMP Performs LU decomposition without factorization
%   Usage: [L, U] = lu_decomposition(A);
[m, n] = size(A);

L = eye(n); U = A;

% LU decomposition, row version
for k=1:n -1
    L(k+1:n,k) = U(k+1:n,k)/U(k,k); % multiplikatory
    for j = k+1:n
        U(j,k:n) = U(j,k:n)-L(j,k)*U(k,k:n); % radky
    end
end

disp(L);
disp(U);
end

