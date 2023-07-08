function [ U, S, V ] = USVT_vl( A )
%USVT Summary of this function goes here
%   Detailed explanation goes here

[m,n]=size(A);

ATA=A'*A;
[V,D]=eig(ATA);
S=sqrt(D);
[Q,R]=qr(A*V);
dRS=ones(m,1);
dRS(1:n,1)=diag(R)./diag(S);
RS=diag(dRS);
U=Q*RS;

end

