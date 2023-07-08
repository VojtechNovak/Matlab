% Script slouzi k demonstraci vyuziti predpodminovace pri iteracnim reseni
% soustavy linearnich rovnic.

%% Vytvorime symetrickou diagonalne dominantni (pozitivne definitni) matici A
n = 10;
U = triu( rand( 10, 10 ), 1 );
d = 100 * rand( n, 1 ); 
A = diag( d ) + U + U';
b = rand( n, 1 );
x0 = zeros( n, 1 );

tol = 1e-6;

%% Vytvorime diagonalni predpodminovac
M = diag(diag(A));


%% Vyresime soustavu bez a s predpodminenim
[ x1, k1, res_unprec ] = richardson( A, b, x0, tol );
[ x2, k2, res_prec ] = richardson_prec( A, b, x0, M, tol );

%% Vykreslime normy residui
semilogy(res_unprec);
hold on
semilogy(res_prec);

xlabel('Cislo iterace');
ylabel('Norma rezidua');
legend('Bez predpodmineni', 'S predpodminenim');
grid on

