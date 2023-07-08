function [ x ] = DSP( D, Z )
%diagonal scaling phase 

if nargin~=2
    error('Insufficient number of input parameters!');
end

m = length(D);

d = diag(D);

x = zeros(m, 1);


x(1) = Z(1) / d(1,1);
for i = 2:m
    x(i) = Z(i) / d(i,i); 
end

end