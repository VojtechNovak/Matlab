function [ Q,R ] = QR_H_vl( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[m,n]=size(A);
R=A;
Q=eye(m);

for j=1:n               %po sloupcich
    x=R(j:m,j);
    Px=zeros(m-j+1,1);
    Px(1)=norm(x);
    v=-sign(x(1))*Px-x;
    PI=eye(m-j+1)-2*(v*v')/(v'*v);
    P=eye(m);
    P(j:m,j:m)=PI;
    R=P*R;
    Q=Q*P;
end

end

