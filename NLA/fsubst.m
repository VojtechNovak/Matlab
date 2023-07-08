function [ x ] = fsubst( L, b )
%FSUBST Solves the system with lower triangular matrix L and RHS vector b
%   Usage: x = fsubst( L, b )
% See also: lu

if nargin~=2
    error('Insufficient number of input parameters!');
end

[m, n] = size(L); 

if m~=n
    error('The method only works for square matrices!');
end


x = zeros(m, 1);


x(1) = b(1) / L(1, 1);
for i = 2:m
    x(i) = (b(i) - L(i, 1:i-1)*x(1:i-1)) / L(i, i); 
end
end

