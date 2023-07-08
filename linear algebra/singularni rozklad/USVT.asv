function [ U, S, V ] = USVT( A )
%USVT singularni rozklad
%   Detailed explanation goes here

[n,m]=size(A);
O=zeros(n);
H=[O,A';A,O];
[Q,D]=eig(H);
[ds,p]=sort(diag(D),1,'descend');
Dp=D(p,p);
Qp=sqrt(2)*Q(:,p);
U=Qp(n+1:2*n,1:n);
V=Qp(1:n,1:n);
S=Dp(1:n,1:n);
norm(A-U*S*V');

end

