function [ xQR, xLU ] = Uloha3( A, b )
%ULOHA3 Summary of this function goes here
%   Detailed explanation goes here

[L, U, P]=lu(A);
[Q, R]=qr(A);

m=Q\b;
xQR=R\m;

n=P*b;
p=L\n;
xLU=U\p;



end

