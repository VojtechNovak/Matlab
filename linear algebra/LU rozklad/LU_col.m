function [ L, U ] = LU_col( A )
%UNTITLED LU rozklad - sloupcova verze
%   Detailed explanation goes here

U=A;
[n,m]=size(A);
L=eye(n);

for k=1:n-1
    L(k+1:n,k)=U(k+1:n,k)/U(k,k);
    for j=k:n
        U(k+1:n,j)=U(k+1:n,j)-L(k+1:n,k)*U(k,j);
    end
end

end

