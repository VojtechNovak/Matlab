%% Vytvorime symetrickou diagonalne dominantni matici nahodnych cisel 
% (tedy symetrickou pozitivne definitni)
rng(7,'twister'); % nastavuje generator nahodnych cisel, aby vracel 
                  % reprodukovatelne hodnoty

n = 10;
U = triu( rand( 10, 10 ), 1 );
d = 1000 * rand( n, 1 ); 
A1 = diag([1 4 5 3 4 3 2 5 2 1]);
A = diag( d ) + U + U';
b = rand( n, 1 );
u0 = zeros( n, 1 );

%% Priklad 2
[ u1, i1, res1 ] = cg_IM( A1, b, u0 );  

L = length(res1)
figure(2)
plot(1:L,res1)
grid

%% test 
A2 = [24 -5 3 7;
      -5 18 5 -2;
      3 5 14 3;
      7 -2 3 30];
b2 = [5;6;7;8];
u0 = [1;1;1;1];

[ u2, i2, res2 ] = cg_IM( A2, b2, u0, 2 );

u_Matlab = A2\b2;
n = norm( u2 - u_Matlab); 

%% Priklad 1
[ u, i, res ] = cg( A2, b2, u0 , 1e-12, 2 );  

L = length(res)
figure(1)
plot(1:L,res)
grid