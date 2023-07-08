%% V tomto skriptu budu resit rovnice typu Ax = b za pomoci jacobiho iteracni metody
% 1, se symetrickou pozitivne definitni matici
% 2, s ridkou symetrickou pozitivne definitni matici
% 3, s trojdiagonalni matici

%% 1, SPD matice

% vygeneruji testovaci SPD matici pomoci predpripraveneho generatoru a vektor b

n = randi([300,500]);                  % nahodna velikost matice

A  = gen_SPD( n );

b = randi([1,9],n,1);               % vektor s nahodnymi celymi cisly

x0 = ones( n, 1 );                   

tol = 1e-15;

[ x1 ,k1 , e1 ] = JACOBI2( A, b, x0, tol );

x1_Matlab = A\b;
n1 = norm( x1 - x1_Matlab); 

if ( n1 < 1e-8 )
  fprintf('1, Jacobi pravdepodobne pracuje spravne.\n\n');
else
  fprintf('1, Jacobi nejspis chyba.\n\n');
end

%% 2, ridka SPD matice

 d = 0.3; % hustota ridke matice

 B  = gen_sparseSPD( n , d ); % generuji ridkou symetrickou matici, ktera je striktne diagonalne dominantni
 
 [ x2, k2 , e2 ] = JACOBI2( B, b, x0, tol );
 
 x2_Matlab = B\b;
n2 = norm( x2 - x2_Matlab); 

if ( n2 < 1e-8 )
  fprintf('2, Jacobi pravdepodobne pracuje spravne.\n\n');
else
  fprintf('2, Jacobi nejspis chyba.\n\n');
end

%% 3, trojdiagonalni matice

C  = gen_tridiag( n );  % generuje trojdiagonalni matici o velikosti n
 
 [ x3, k3 , e3 ] = JACOBI2( C, b, x0, tol );
 
 x3_Matlab = C\b;
n3 = norm( x3 - x3_Matlab); 

if ( n3 < 1e-8 )
  fprintf('3, Jacobi pravdepodobne pracuje spravne.\n');
else
  fprintf('3, Jacobi nejspis chyba.\n');
end

%% Vykreslime jak rychle dojdou jednotliva reseni k pozadovane toleranci

semilogy(e1);
hold on
semilogy(e2);
semilogy(e3);

xlabel('Cislo iterace');
ylabel('Vektor chyby');
legend('plna SPD', 'ridka SPD', 'tridiag');
grid on