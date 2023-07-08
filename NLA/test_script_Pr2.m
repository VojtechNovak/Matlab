%% Vytvorme testovaci matici
n = 10;
U = triu( rand( 10, 10 ), 1 );
d = 100 * rand( n, 1 ); 
A = diag( d ) + U + U';
b = rand( n, 1 );
x0 = zeros( n, 1 );

tol = 1e-6;
maxIt = 1000;

%% Otestujeme metodu nejvetsiho spadu
[ x, k, residuals_sd ] = steepestDescent( A, b, x0, tol, maxIt );
[ x, k, residuals_cg1 ] = cg1( A, b, x0, tol, maxIt );

%% Vykreslime normy residui
semilogy(residuals_sd);
hold on
semilogy(residuals_cg1);

xlabel('Cislo iterace');
ylabel('Norma rezidua');
legend('Nejvetsi spad', 'Sdruzene gradienty');
grid on
