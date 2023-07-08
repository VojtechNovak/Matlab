A = gen_SPD(10);

b = randi([1,9],10,1);               % vektor s nahodnymi celymi cisly

x0 = ones( 10, 1 );                   

tol = 1e-12;

[ x ,k , e ] = JACOBI2( A, b, x0, tol );




