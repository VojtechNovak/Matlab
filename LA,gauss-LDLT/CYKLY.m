function [zeros] = matrix_cycles(m ,n)
A = rand(m, n)
zeros = 0;

 for i = 1:m
   for j = 1:n
if A(i,j) < 0.5;
A(i,j) = 0.0;
zeros = zeros + 1;
end
 end
  end
fprintf('pocet nulovych prvku: %f8.4?n', zeros);
end