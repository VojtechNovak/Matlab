function [ zeros ] = matrix_cycles(m, n)
%MATRIX_CYCLES Demonstration of the Matlab cycles and conditions
%   m number of rows
%   n number of columns

A = rand(m, n);
zeros = 0;

for i = 1:m
  for j = 1:n
    if A(i, j) < 0.5
      A(i, j) = 0.0;
      zeros = zeros + 1;
    end
  end
end
fprintf('pocet nulovych prvku: %f8.4?n', zeros);
end

