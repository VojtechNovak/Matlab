% Aproximujme kvadratickym polynomem p(x) = c1 + c2 * x + c3 * x^2
% namerena data tak, abychom minimalizovali 
% chybu ve smyslu nejmensich ctvercu

% V pripade aproximace pomoci kvadraticke funkce p(x) = c1 + c2 * x + c3 * x^2 
% bude mit systemova matice A tvar
% A = [ 1 x1 x1^2
%       1 x2 x2^2
%       ... 
%       1 xm xm^2]
% a vektor c bude mit delku 3.

%% vygenerujme nejprve presna testovaci data s pouzitim funkce 
% p(x) = 5 - x + 0.1 * x^2
x = 5 : 0.2 : 8;
x = x';
y = 5 - x + 0.1 * x.^2;
m = length( x );

%% zatizime vypoctena data nahodnym sumem - simulujeme mereni
y = y + 0.04 * max(y) * ( rand( size( y ) ) - 0.5);

%% vykreslime data zanesena sumem
close all
hold on
plot(x, y, 'bo');
grid on;
xlim( [ x( 1 ) - 0.2, x( end ) + 0.2 ] );
ylim( [ min( y ) - 0.2, max( y ) + 0.2 ] );
xlabel( 'x' ); ylabel( 'y' ); 
legend( 'namerena data' );

disp('Stiskni enter pro pokracovani.')
pause 

disp('Reseni problemu nejmensich ctvercu pomoci QR rozkladu.')
%% sestavime systemovou matici
A = % doplnte

%% vypocteme uplny QR rozklad matice A (pouzijeme zabudovanou funkci qr)
[Q Rhat] = qr( A )
% vybereme z matice R pouze odpovidajici blok
R = % doplnte

yhat = % doplnte

%% najdeme koeficienty c
c = % doplnte 

disp('Nalezena kvadraticka funkce aproximujici testovaci data nejlepe ve smyslu nejmensich ctvercu: ')
fprintf('p(x) = %3.2f + %3.2fx + %3.2fx^2 \n',c)

%% vykreslime aproximacni funkci 
xx = linspace( x( 1 ), x( end ), 100 );
yy = c( 1 ) + c( 2 ) * xx + c( 3 ) * xx.^2;
plot(xx, yy, 'g-', 'LineWidth', 2);
legend( 'namerena data', 'nalezena aproximacni funkce' );