function [ A ] = Tridiag( A )
%TRIDIAG redukce na 3diagonalni tvar (Householder)
%   Detailed explanation goes here

[n,m]=size(A);
Q=eye(m);

for j=1:n-2
    x=A(j+1:n,j);           %j-ty sloupec
    v=-sign(x(1))*norm(x)*eye(n-j,1)-x;
    if norm(v)>0
        v=v/norm(v);
        P=eye(n);
        P(j+1:n,j+1:n)=P(j+1:n,j+1:n)-2*v*v';
        A=P*A*P;
        Q=Q*P;
    end

end





end

