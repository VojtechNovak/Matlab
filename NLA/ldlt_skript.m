%% V tomto skriptu budu resit rovnice typu Ax = b za pomoci LDL' rozkladu
% 1, s plnou symetrickou matici
% 2, s ridkou symetrickou matici
% 3, s trojdiagonalni matici

%% 1, plna symetricka matice

% vygeneruji testovaci symetrickou matici pomoci predpripraveneho generatoru a vektor b

n = randi([900,1000]);                  % nahodna velikost matice

[ A ] = gen_symmetric( n );

b = randi([1,9],n,1);               % vektor s nahodnymi celymi cisly

X1 = LDLTrovnice( A , b );

% Otestujeme, zda je reseni v poradku:
x1_Matlab = A\b;
n1 = norm( X1 - x1_Matlab);

if ( n1 < 1e-8 )
  fprintf('1, je nejspis spravne.\n\n');
else
  fprintf('1, Nekde se stala chyba.\n\n');
end
%% 2, ridka symetricka matice s hustotou d

d = 0.3;

B = gen_sparseSymmetric( n , d );

X2 = LDLTrovnice( B , b );

% Otestujeme, zda je reseni v poradku:
x2_Matlab = B\b;
n2 = norm( X2 - x2_Matlab);

if ( n2 < 1e-8 )
  fprintf('2, je nejspis spravne.\n\n');
else
  fprintf('2, Nekde se stala chyba.\n\n');
end

%% 3,trojdiagonalni matice

C = gen_tridiag( n );

X3 = LDLTrovnice ( C , b );

% Otestujeme, zda je reseni v poradku:
x3_Matlab = C\b;
n3 = norm( X3 - x3_Matlab);

if ( n3 < 1e-1 )
  fprintf('3, je nejspis spravne.\n\n');
else
  fprintf('3, Nekde se stala chyba.\n\n');
end




