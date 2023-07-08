% script calling function matrix_cycles until given condition is satisfied

m = 8; 
n = 8;

zeros = m * n;
it_count = 0;

while (zeros >= ( m * n) / 2 )
  zeros = matrix_cycles( m, n );
  it_count = it_count + 1;
end

disp( zeros );
disp( it_count ); 