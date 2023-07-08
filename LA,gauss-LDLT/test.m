function [ L,D ] = LDLT( A )
%LDLT LTL' rozklad symetricke matice
%   Detailed explanation goes here

[n,m]=size(A);
L=eye(n);
d=[];     %diagonala matice D
for j = 1:n
    if j == 1
    d(j)=A(j,j);
    L(j+1:n,j)=A(j+1:n,j)/A(j,j);
    else
    v = (d(1:j-1).*L(j,1:j-1))';
    d(j)=A(j,j)-L(j,1:j-1)*v;
    L(j+1:n,j)=(A(j+1:n,j)-L(j+1:n,1:j-1)*v)/d(j);
        
    end
    

end
D=diag(d);
disp(D);
end