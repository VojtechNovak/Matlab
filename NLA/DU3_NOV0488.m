% NLA1 - miniprojekt 3
%
% Jmeno: Vojt?ch Novák
% Login: NOV0488
% Datum: 24/3/2020

% V tomto projektu budeme pomoci LU rozkladu resit soustavu Ax = b.

%% Vytvorime testovaci matici a vektor prave strany
n = 10;
A = round( rand( n, n ), 3 );
b = round( rand( n, 1 ), 3 );

%% Priklad 1
% Vytvorte v samostatnem souboru funkci [ L, U ] = lu_decomposition( A ),
% ktera pomoci LU rozkladu dekomponuje vstupni matici A na soucin dolni
% trojuhelnikove matice L a horni trojuhelnikove matice U: A = L * U.
% Vyjdete napr. z pseudokodu uvedeneho v pdf se zadanim DU nebo v prezentaci. 

% Zavolame vami vytvorenou funkci:
[ L, U ] = lu_decomposition( A );  

% Otestujeme, zda je rozklad v poradku:
n = norm( L*U - A, 'fro' ); 

if ( n < 1e-5 )
  fprintf('Vase funkce lu_decomposition pravdepodobne pracuje spravne.\n\n');
else
  fprintf('Ve funkci lu_decomposition nejspis chyba.\n\n');
end

%% Priklad 2
% Vyuzijte znalost LU rozkladu A k vyreseni soustavy Ax = b pomoci dopredne 
% a zpetne substituce. Pouzijte vami vytvorene funkce fsubst a bsubst 
% ze Cviceni 4.
% Zopakujme: Ax = b <==> L(Ux)=b <==> Ly = b, kde Ux = y
y = fsubst(L,b);
x = bsubst(U,y);

% Otestujeme, zda je reseni v poradku:
x_Matlab = A \ b;
n = norm( x - x_Matlab );
if ( n < 1e-5 )
  fprintf('Ziskali jste spravne reseni.\n\n');
else
  fprintf('Nekde je nejspis chyba.\n\n');
end