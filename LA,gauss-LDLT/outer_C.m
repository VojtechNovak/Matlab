m = 6;
n = 6;
zeros = m*m;
it_count = 0;

while (zeros >= (m*n)/2)
zeros = matrix_cycles(m, n);
it_count = it_count + 1;
end

disp(it_count);
disp(zeros);