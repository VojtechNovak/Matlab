%% V tomto skriptu budu resit rovnice typu Ax = b za pomoci LDL' rozkladu
% 1, s plnou symetrickou matici
% 2, s ridkou symetrickou matici
% 3, s trojdiagonalni matici

%% 1, plna symetricka matice

% vygeneruji testovaci symetrickou matici pomoci predpripraveneho generatoru a vektor b

n = randi([900,1000]);                  % nahodna velikost matice

[ A ] = gen_symmetric( n );

b = randi([1,9],n,1);               % vektor s nahodnymi celymi cisly

[X1,t] = LDLTrovnice( A , b );

% Otestujeme, zda je reseni v poradku:
timer1 = tic;
x1_Matlab = A\b;
times1 = toc(timer1);
n1 = norm( X1 - x1_Matlab);
tL1 = t(n);

plot(1:n,t);

if ( n1 < 1e-4 )
  fprintf('1, je nejspis spravne.\n\n');
else
  fprintf('1, Vysledek neni presne.\n\n');
end
%% 2, ridka symetricka matice s hustotou d

d = 0.3;

B = gen_sparseSymmetric( n , d );

[X2,t2] = LDLTrovnice( B , b );

% Otestujeme, zda je reseni v poradku:
timer2 = tic;
x2_Matlab = B\b;
times2 = toc(timer2);
tL2 = t2(n);
n2 = norm( X2 - x2_Matlab);

if ( n2 < 1e-4 )
  fprintf('2, je nejspis spravne.\n\n');
else
  fprintf('2, Vysledek neni presne.\n\n');
end

%% 3,trojdiagonalni matice

C = gen_tridiag( n );

[X3,t3] = LDLTrovnice ( C , b );

% Otestujeme, zda je reseni v poradku:
timer3 = tic;
x3_Matlab = C\b;
times3 = toc(timer3);
tL3 = t3(n);
n3 = norm( X3 - x3_Matlab);

if ( n3 < 1e-1 )
  fprintf('3, je nejspis spravne.\n\n');
else
  fprintf('3, Vysledek neni presne.\n\n');
end




