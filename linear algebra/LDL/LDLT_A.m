function [ L,D ] = LDLT_A( A )
%LDLT LTL' rozklad symetricke matice, prepisovani matice A
%   Detailed explanation goes here

[n,m]=size(A);

for j=1:n
    if j==1,                              
        A(j+1:n,j)=A(j+1:n,j)/A(j,j);     %prvni sloupec matice L - multiplikatory
    else
        x=diag(A)';
        x(1:j-1)
        A(j,1:j-1)
        x(1:j-1).*A(j,1:j-1)
        v = (x(1:j-1).*A(j,1:j-1))'      %nas. po prvcich - znama cast d * j-ty radek L
        A(j,j) = A(j,j)-A(j,1:j-1)*v;     %diagonalni prvek minus skalarni soucin
        
        A(j+1:n,j) = (A(j+1:n,j)-A(j+1:n,1:j-1)*v)/A(j,j);    %j-ty sloupec L
    end
end     
        
D=diag(diag(A));
L=eye(n)+tril(A,-1);

end

