function [ L, U ] = LU_row_x( A )
%UNTITLED LU rozklad - radkova verze, prepisujeme A
%   Detailed explanation goes here

[n,m]=size(A);

for k=1:n-1
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    for j=k+1:n
        A(j,k+1:n)=A(j,k+1:n)-A(j,k)*A(k,k+1:n);
    end
end

L=tril(A,-1)+eye(n);
U=triu(A);

end
