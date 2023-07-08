function [ Q,D ] = QDQT( A )
%QDQT Summary of this function goes here
%   Detailed explanation goes here
[n,m]=size(A);
D=A;
Q=eye(n);

while norm(D-diag(diag(D))) >= 0.01
    [Qk,Rk]=qr(D);
    D=Rk*Qk;
    Q=Q*Qk;
end

end

