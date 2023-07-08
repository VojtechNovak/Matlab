function [ L, U, P ] = Uloha2( A )
%ULOHA2 Summary of this function goes here
%   Detailed explanation goes here

[m,n]=size(A);
C=cell(1,n);

for i=1:n
    [L1,U1,P1]=LUP(A{1});
    L{i}=L1;
    U{i}=U1;
    P{i}=P1;
end

end

