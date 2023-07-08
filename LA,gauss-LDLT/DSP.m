function [ x ] = DSP( D, Z )
%diagonal scaling phase 

if nargin~=2
    error('Insufficient number of input parameters!');
end

[m, n] = size(D); 

if m~=n
    error('The method only works for square matrices!');
end


x = zeros(m, 1);


x(1) = Z(1) / D(1, 1);
for i = 2:m
    x(i) = Z(i) / D(i, i); 
end

end