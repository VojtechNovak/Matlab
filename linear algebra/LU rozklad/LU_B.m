function [ L, U ] = LU_B( A )
%UNTITLED LU rozklad - radkova verze, prepisujeme A
%   Detailed explanation goes here

[n,m]=size(A);
L=eye(n);
U=zeros(n);

for k=1:n
    if k==1,
        v(k:n)=A(k:n,k);
    else
        z = L(1:k-1,1:k-1)\A(1:k-1,k);
        U(1:k-1,k)=z;
        v(k:n)=A(k:n,k)-L(k:n,1:k-1)*z;
    end
    if k<n,
        L(k+1:n,k)=v(k+1:n)/v(k);
    end
    U(k,k)=v(k);
end

end
