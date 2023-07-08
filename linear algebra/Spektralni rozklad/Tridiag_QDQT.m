function [ Q,D ] = Tridiag_QDQT( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[n,m]=size(A);
Q=eye(m);
D=A;

for j=1:n-2
    x=D(j+1:n,j);           %j-ty sloupec
    v=-sign(x(1))*norm(x)*eye(n-j,1)-x;
    if norm(v)>0
        v=v/norm(v);
        P=eye(n);
        P(j+1:n,j+1:n)=P(j+1:n,j+1:n)-2*v*v';
        D=P*D*P;
        Q=Q*P;
    end
end

while norm(D-diag(diag(D))) >= 0.01
    mu=D(n,n);
    [Qk,Rk]=qr(D-mu*eye(n));
    D=Rk*Qk+mu*eye(n);
    Q=Q*Qk;
end


end

