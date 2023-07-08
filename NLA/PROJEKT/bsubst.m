function [ x ] = bsubst( U, b )
%FSUBST Solves the system with upper triangular matrix U and RHS vector b
%   Usage: x = bsubst( U, b )
% See also: lu

if nargin~=2
    error('Insufficient number of input parameters!');
end

[m, n] = size(U); 

if m~=n
    error('The method only works for square matrices!');
end

x = zeros(m, 1);

x(n) = b(n) / U(n, n);
for i = n-1:-1:1
    x(i) = (b(i) - U(i, i+1:n)*x(i+1:n)) / U(i, i); 
end


end

