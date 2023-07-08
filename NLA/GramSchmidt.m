function [ Q,R ] = GramSchmidt( V )
%GRAMSCHMIDT Summary of this function goes here
% Gramuv-Schmidtuv proces pro porovnani s modifikovanym G-S algoritmem
% prubezne ukladano do matic Q, R
% pouze pro ctvercovou matici s plnou honosti
% !!psano s durazem na jednoduchost kodu, ne efektivitu!!
n=length(V);
R=zeros(n);
Q=zeros(n);
R(1,1)=norm(V(:,1));
Q(:,1)=V(:,1)/R(1,1);
for j=2:n
    suma=0;
    for k=1:j-1
        R(k,j)=V(:,j)'*Q(:,k);
        suma=suma+R(k,j)*Q(:,k);
    end
    temp=V(:,j)-suma;
    R(j,j)=norm(temp);
    Q(:,j)=temp/R(j,j);
end

end