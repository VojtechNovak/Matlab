% NLA1 - miniprojekt 5
%
% Jmeno: Vojtech Novak
% Login: NOV0488
% Datum: 17.4.2020

% V tomto projektu budeme resit soustavu Ax = b se symetrickou pozitivne 
% definitni matici iteracne pomoci metody nejvetsiho spadu.

%% Vytvorime symetrickou diagonalne dominantni matici nahodnych cisel 
% (tedy symetrickou pozitivne definitni)
rng(7,'twister'); % nastavuje generator nahodnych cisel, aby vracel 
                  % reprodukovatelne hodnoty

n = 10;
U = triu( rand( 10, 10 ), 1 );
d = 1000 * rand( n, 1 ); 
A = diag( d ) + U + U';
b = rand( n, 1 );
x0 = zeros( n, 1 );


%% Priklad 1
% Stahnete si funkci steepestDescent_ex:
% http://homel.vsb.cz/~mer126/NLA1/Lectures/8/Cv/steepestDescent_ex.m
% 
% Doplnte do hlavni smycky chybejici vypocty (viz napr. poznamky na webu).


% Zavolame vami vytvorenou funkci:
[ x, k ] = steepestDescent_ex( A, b, x0, 1e-12, 1000 );  

% Otestujeme, zda je reseni v poradku:
x_Matlab = A\b;
n = norm( x - x_Matlab); 

if ( n < 1e-8 )
  fprintf('Vase funkce steepestDescent pravdepodobne pracuje spravne.\n\n');
else
  fprintf('Ve funkci steepestDescent nejspis chyba.\n\n');
end

%% Priklad 2
% Pomoci metody steepestDescent_ex vyreste soustavu s ruznou presnosti.
% Zapiste pocty iteraci potrebne k dosazeni dane presnosti do tabulky:
[ x, k1 ] = steepestDescent_ex( A, b, x0, 0.01, 2000 );
[ x, k2 ] = steepestDescent_ex( A, b, x0, 0.0001, 2000 );
[ x, k3 ] = steepestDescent_ex( A, b, x0, 1e-8, 2000 );

fprintf("Pocty iteraci metody nejvetsiho spadu: \n");
disp( [ k1, k2, k3 ] );

% Doplnte tabulku:
% Metoda nejvetsiho spadu:
% tol = 0.01,   k = 203
% tol = 0.0001, k = 443
% tol = 1e-8,   k = 927
