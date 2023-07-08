function [ L, U ] = LU_row( A )
%UNTITLED LU rozklad - radkova verze
%   Detailed explanation goes here

U=A;
[n,m]=size(A);
L=eye(n);

for k=1:n-1
    L(k+1:n,k)=U(k+1:n,k)/U(k,k);
    for j=k+1:n
        U(j,k:n)=U(j,k:n)-L(j,k)*U(k,k:n);
    end
end

end

