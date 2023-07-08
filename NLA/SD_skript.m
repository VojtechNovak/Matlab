%% V tomto skriptu budu resit rovnice typu Ax = b za pomoci metody nejvetsiho spadu
% 1, se symetrickou pozitivne definitni matici
% 2, s ridkou symetrickou pozitivne definitni matici
% 3, s trojdiagonalni matici

%% 1, SPD matice

% vygeneruji testovaci SPD matici pomoci predpripraveneho generatoru a vektor b

n = randi([1000,2000]);                  % nahodna velikost matice

A  = gen_SPD( n );                   % generator SPD matice s n velikosti

b = randi([1,9],n,1);               % vektor s nahodnymi celymi cisly

x0 = ones( n, 1 );                  %  Inicializace

tol = 1e-12;                       % tolerance

maxIt = 1000;                      % maximalni pocet iteraci
timer1 = tic;
[ x1, k1, residuals1 ] = steepestDescent( A, b, x0, tol, maxIt );
times1 = toc(timer1);

timer1M = tic;
x1_Matlab = A\b;    % matlabovske reseni (presne reseni)
times1M = toc(timer1M);
n1 = norm( x1 - x1_Matlab); % presnost reseni

if ( n1 < 1e-8 )
  fprintf('1, steepestDescent vyresil plnou matici za: \n');
  disp(times1);
else
  fprintf('1, steepestDescent nejspis chyba.\n');
end
fprintf('Matlab vyresil plnou matici za: \n');
disp(times1M);

%% 2, ridka SPD matice

 d = 0.3; % hustota ridke matice

 B  = gen_sparseSPD( n , d ); % generuji ridkou symetrickou matici, ktera je striktne diagonalne dominantni
 timer2 = tic;
 [ x2, k2, residuals2 ] = steepestDescent( B, b, x0, tol, maxIt );
 times2 = toc(timer2);
 timer2M = tic;
 x2_Matlab = B\b;
 times2M = toc(timer2M);
n2 = norm( x2 - x2_Matlab); 

if ( n2 < 1e-8 )
  fprintf('2, steepestDescent vyresil ridkou matici za:\n');
  disp(times2);
else
  fprintf('2, steepestDescent nejspis chyba.\n');
end

fprintf('Matlab vyresil ridkou matici za:\n');
disp(times2M);
%% 3, trojdiagonalni matice

C  = gen_tridiag( n );  % generuje trojdiagonalni matici o velikosti n
 
timer3 = tic;
 [ x3, k3, residuals3 ] = steepestDescent( C, b, x0, tol, maxIt );
 times3 = toc(timer3);
 timer3M = tic;
 x3_Matlab = C\b;
 times3M = toc(timer3M);
n3 = norm( x3 - x3_Matlab); 

if ( n3 < 1e-8 )
  fprintf('3, steepestDescent vyresil trojdiagonalni matici za :\n');
  disp(times3);
else
  fprintf('3, steepestDescent nejspis chyba.\n');
end
fprintf("Matlab vyresil trojdiagonalni matici za: \n");
disp(times3M);


%% Vykreslime normy residui

semilogy(residuals1);
hold on
semilogy(residuals2);
semilogy(residuals3);

xlabel('Cislo iterace');
ylabel('Norma rezidua');
legend('plna SPD', 'ridka SPD', 'tridiag');
grid on




