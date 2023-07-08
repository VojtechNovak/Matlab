function [ C ] = rovnice( A,B )
%ROVNICE Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(A);
C=cell(1,n);

for i=1:n
    [a,b]=size(A{i});
    M(1:a,1:b)=A{i};
    M(:,b+1)=B{i};
    if rank(A{i})==rank(M) && rank(M)==a,
        C{i}=A{i}\B{i};
    elseif rank(A{i})<rank(M),
        C{i}='Nema reseni';
    else
        C{i}='Nekonecne mnoho reseni'
    end
end


end

