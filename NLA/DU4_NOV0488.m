% NLA1 - miniprojekt 4
%
% Jmeno: Vojtech Novak
% Login: NOV0488
% Datum: 30.3.2020

% V tomto projektu budeme resit soustavu Ax = b iteracne pomoci Jacobiho a 
% Gaussovy-Seidelovy metody.

%% Vytvorime testovaci matici, vektor prave strany a pocatecni aproximaci

A = [ 4 2 1; 3 10 3; 1 1 5 ];
b = [ 2; 4; 3 ];
x0 = ones( 3, 1 );

%% Priklad 1
% Vytvorte v samostatnem souboru funkci [ x , k ] = gauss_seidel( A, b, x0, tol ),
% ktera bude resit Ax=b pomoci Gaussovy-Seidelovy metody. Na vstupu bude matice
% A, vektor prave strany, pocatecni aproximace a pozadovana presnost (0<tol<1). 
% Metoda bude vracet odhad reseni a pocet iteraci potrebny k dosazeni tohoto 
% odhadu.
% Jako ukoncovaci podminku volte relativni zmenu normy vektoru rezidua (r=b-Ax),
% tzn. ||rk|| < tol * ||r0||, tedy ||rk||/||r0|| < tol
% Vyjdete napr. z pseudokodu uvedeneho v pdf se zadanim DU. Muzete vyjit take z 
% funkce pro Jacobiho metodu - kod bude velmi podobny.

% Zavolame vami vytvorenou funkci:
[ x, k ] = gauss_seidel( A, b, x0, 1e-12 );  

[ x1, k1 ] = Richardson_V( A, b,x0,1e-12,1000 );  
% Otestujeme, zda je reseni v poradku:
x_Matlab = A\b;
n = norm( x - x_Matlab); 
n1 = norm( x1 - x_Matlab);
if ( n < 1e-8 )
  fprintf('Vase funkce gauss_seidel pravdepodobne pracuje spravne.\n\n');
else
  fprintf('Ve funkci gauss_seidel nejspis chyba.\n\n');
end


if ( n1 < 1e-8 )
  fprintf('Vase funkce Richardson pravdepodobne pracuje spravne.\n\n');
else
  fprintf('Ve funkci Richardson nejspis chyba.\n\n');
end

%% Priklad 2
% Pomoci metody jacobi ze cviceni a metody gauss_seidel vyreste vyse
% definovanou soustavu Ax=b s ruznou presnosti tol. Zapiste pocty iteraci
% potrebne k dosazeni dane presnosti do tabulky:
[ x_Jac_1, k_Jac_1 ] = jacobi( A, b, x0, 0.01 );
[ x_Jac_2, k_Jac_2 ] = jacobi( A, b, x0, 0.0001 );
[ x_Jac_3, k_Jac_3 ] = jacobi( A, b, x0, 1e-8 );

[ x_GS_1, k_GS_1 ] = gauss_seidel( A, b, x0, 0.01 );
[ x_GS_2, k_GS_2 ] = gauss_seidel( A, b, x0, 0.0001 );
[ x_GS_3, k_GS_3 ] = gauss_seidel( A, b, x0, 1e-8 );

[ x_R_1, k_R_1 ] = Richardson_V( A, b,x0,0.01,1000 );
[ x_R_2, k_R_2 ] = Richardson_V( A, b,x0,0.0001,1000 );
[ x_R_3, k_R_3 ] = Richardson_V( A, b,x0,1e-8,1000 );

fprintf("Pocty iteraci Jacobiho metody: \n");
disp( [ k_Jac_1, k_Jac_2, k_Jac_3 ] );
fprintf("Pocty iteraci Gaussovy-Seidelovy metody: \n");
disp( [ k_GS_1, k_GS_2, k_GS_3 ] );
fprintf("Pocty iteraci Richardsonovy metody: \n");
disp( [ k_R_1, k_R_2, k_R_3 ] );
% Doplnte tabulku:
% Jacobi:
% tol = 0.01,   k = 9
% tol = 0.0001, k = 17
% tol = 1e-8,   k = 34

% Gauss-Seidel:
% tol = 0.01,   k = 3
% tol = 0.0001, k = 6
% tol = 1e-8,   k = 11