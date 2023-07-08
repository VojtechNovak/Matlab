function [ Q,R ] = QR_H( A )
%QR_H QR pomoci Householderovy transformace
%   Detailed explanation goes here

[m,n]=size(A);
Q=eye(m);
R=A;

for j=1:n
    x=R(j:m,j);
    v=-sign(x(1))*norm(x)*eye(m-j+1,1)-x;
    if norm(v)>0
        v=v/norm(v);
        P=eye(m);
        P(j:m,j:m)=P(j:m,j:m)-2*v*v';
        R=P*R;
        Q=Q*P;
    end

end

