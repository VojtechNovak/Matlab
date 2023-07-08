function [ L,D,tt ] = LDLT( A )
%LDLT LTL' rozklad symetricke matice
%   Detailed explanation goes here

[n,m]=size(A);
L=eye(n);
d=zeros(n);     %diagonala matice D

for j=1:n
    tic
    if j==1                             
        d(j) = A(j,j);                  %prvek A(1,1) 
        L(j+1:n,j)=A(j+1:n,j)/d(j);     %prvni sloupec matice L - multiplikatory
    else
        v = (d(1:j-1).*L(j,1:j-1))';    %nas. po prvcich - znama cast d * j-ty radek L
        d(j) = A(j,j)-L(j,1:j-1)*v;     %diagonalni prvek minus skalarni soucin
        
        L(j+1:n,j) = (A(j+1:n,j)-L(j+1:n,1:j-1)*v)/d(j);    %j-ty sloupec L
    end
    t(j) = toc;
    tt(j) = sum(t);
end         
D = d(1:n , 1);
for i = 1 :n
    
end
end

