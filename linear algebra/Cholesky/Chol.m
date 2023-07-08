function [ L ] = Chol( A )
%LDLT LTL' rozklad symetricke matice
%   Detailed explanation goes here

[n,m]=size(A);
L=eye(n);

for j=1:n
    if j==1,                             
        L(j,j) = sqrt(A(j,j));
        L(j+1:n,j)=A(j+1:n,j)/L(j,j);     %prvni sloupec matice L - multiplikatory
    else
        v = L(j,1:j-1)';                %j-ty radek L
        L(j,j) = sqrt(A(j,j)-L(j,1:j-1)*v);     %odm(diagonalni prvek minus skalarni soucin)
        L(j+1:n,j) = (A(j+1:n,j)-L(j+1:n,1:j-1)*v)/L(j,j);    %j-ty sloupec L
    end
end     
        
end

