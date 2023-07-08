function [ A, b, u ] = sit1d( L , N, u0, un )
%SID1D Funkce resi pruhyb struny
% L delka struny
% N pocet prvku site

%% Popis ulohy
% Resime rovnici pruhybu struny zatizene danou silou f na intervalu <0, L>:
% -u''™= f, u( 0 ) = 0, u( L ) = 0;   % rovnice struny + okrajove podminky
% x z <0,L>                            % interval
% f = -sin(x)                          % zatizeni

%% Disretizace intervalu
% Nejdrive rozdelime interval <0, L> na N stejne dlouhych podintevalu, tim
% vznikne n = N + 1 uzlu site { x0, x1, ..., xn }:
n = N + 1;                            % pocet uzlu
h = L / N;                            % krok site
x = ( 0 : h : L )';                   % souradnice uzlu

%% Sestaveni ridke matice A
% Sestavime ridkou tridiagonalni matici A ve tvaru
% A = [  2 -1  0          ... 0;
%       -1  2 -1 0        ... 0;
%        0 -1  2 -1 
%                  ...
%                     -1  2 -1;
%        0 ...           -1  2 ]
%
% Matice soustavy ma rozmery (n-2)x(n-2) protoze v krajnich uzlech reseni zname:
e = ones( n - 2, 1 ); 
A = spdiags( [-e 2*e -e], [-1 0 1], n - 2, n - 2 );

%% Vektor prave strany
% Vyhodnotime funkci prave strany ve vnitrnich bodech intervalu
b = eval('-h^2 * sin(x(2:end-1))');
% Pricteme k prvnimu a poslednimu prvku vektoru prave strany predepsane
% okrajove podminky:
b( 1 ) = b( 1 ) + u0;
b( end ) = b( end ) + un;

%% Numericke reseni
u = A \ b;
% Pro korektni vykresleni doplnime na zacatek a konec vektoru reseni
% predepsane hodnoty:
u = [ u0; u; un ];

%% Vykresleni
figure (1);
plot( x, u, 'r-*' );
title('Vypoctene reseni');