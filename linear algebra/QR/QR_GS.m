function [ Q,R] = QR_GS( A )
%QR_GS Gramuv-Schmidtuv proces
%   Detailed explanation goes here

[m,n]=size(A);
Q=zeros(m,n);
R=Q;

for j=1:n               %pres vsechny sloupce
    v=A(1:n,j);
    for i=1:j-1
        R(i,j)=Q(:,i)'*A(:,j);
        v=v-R(i,j)*Q(:,i);
    end
    R(j,j)=norm(v);
    Q(1:n,j)=v/R(j,j);
end

end

