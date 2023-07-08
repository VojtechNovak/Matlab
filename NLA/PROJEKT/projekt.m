%% V tomto skriptu budou ruzne typy matic testovany ruznymi resici

% 1, symetricka matice
% 2, ridka symetricka matice
% 3, SPD matice
% 4, ridka SPD matice
% 5, trojdiagonalni matice
% s nahodnou velikosti n
n = randi([100,500]);               % velikost matic
b = randi([1,9],n,1);               % vektor s nahodnymi celymi cisly
d = 0.3;                           % hustota ridkych matic

%% 1, symetricka matice

[ A ] = gen_symmetric( n );

[XL,t] = LDLTrovnice( A , b );

% Matlabovske reseni
timer1M = tic;
x1_Matlab = A\b; % mereni casu jak dlouho trva matlabu vyresit rovnici
times1M = toc(timer1M);
time7M = zeros(n,1);
ttt = zeros(n,1);
for i = 1:n % cas reseni v zavislosti na velikosti
    time7M(i) = times1M/n;
    if i ~=1
    ttt(i) = sum(time7M);
    end
end

figure ('Name','symetricka matice');
plot(1:n,t) % rychlost LDLT
hold on
plot(1:n,ttt); % rychlost matlabu

xlabel('Velikost matice');
ylabel('cas(s)');
legend('LDLT', 'MATLAB');
grid on
hold off
%% 2 ridka symetricka matice
[ D ] = gen_sparseSymmetric( n, d );

[Xrs,trs] = LDLTrovnice( D , b );
% Matlabovske reseni
timer2rsM = tic;
x2rs_Matlab = D\b;
times2rsM = toc(timer2rsM);
timersM = zeros(n,1);
tMrs = zeros(n,1);
for g = 1:n
    timersM(g) = times2rsM/n;
    if g ~=1
    tMrs(g) = sum(timersM);
    end
end

figure ('Name','symetricka ridka matice');
plot(1:n,trs)
hold on
plot(1:n,tMrs);

xlabel('Velikost matice');
ylabel('cas(s)');
legend('LDLT', 'MATLAB');
grid on
hold off


%% 3 plna SPD matice
x0 = ones( n, 1 );                 %  Inicializace
tol = 1e-5;                       % tolerance
maxIt = 1000;                      % maximalni pocet iteraci

[ B ] = gen_SPD(n);

[ x33, k33, r33, t33 ] = steepestDescent( B , b , x0 ,tol, maxIt );
[ x22 ,k11 , e11, t22 , pr3 ] = JACOBI2( B, b, x0, tol );

S = sum(t33);
% Matlabovske reseni
timer3M = tic;
x3_Matlab = B\b;
times3M = toc(timer3M); % rychlost matlabvskeho reseni
timeM3 = zeros(k11,1); % rychlost je prevedena na vektor o velikosti iteraci
for j=1:k33            % kvuli zobrazeni v grafu
    timeM3(j) = times3M;
end

figure ('Name','plna SPD matice iterace');
semilogy(t33); % zobrazeni rychlosti iteraci SD
hold on
semilogy(t22); % rychlost iteraci jacobi
semilogy(timeM3) % rychlost matlabu (neni zavisla na iteracich)

xlabel('Pocet iteraci');
ylabel('rychlost(s)');
legend('SD', 'JACOBI','MATLAB');
grid on
%% 4 ridka SPD matice
x0 = ones( n, 1 );                 %  Inicializace
tol = 1e-5;                       % tolerance
maxIt = 1000;                      % maximalni pocet iteraci

[ C ] = gen_sparseSPD( n, d );

[X,t1] = LDLTrovnice( C , b );
[ x3, k, r, t3 ] = steepestDescent( C , b , x0 ,tol, maxIt );
[ x2 ,k1 , e1, t2 , pr ] = JACOBI2( C, b, x0, tol );

% Matlabovske reseni
timer4M = tic;
x2_Matlab = C\b;
times4M = toc(timer4M); % rychlost matlabvskeho reseni
timeM4 = zeros(k1,1); % rychlost je prevedena na vektor o velikosti iteraci
for j=1:k1            % kvuli zobrazeni v grafu
    timeM4(j) = times4M;
end

figure ('Name','ridka SPD matice iterace');
semilogy(t3); % zobrazeni rychlosti iteraci SD
hold on
semilogy(t2); % zobrazeni rychlosti iteraci jacobi
semilogy(timeM4) % rychlost matlabu (je zde jenom pro zobrazeni rychlosti, nezavisi na iteracich)

xlabel('Pocet iteraci');
ylabel('rychlost(s)');
legend('SD', 'JACOBI','MATLAB');
grid on
%% 5 tridiagonalni matice
[ E ] = gen_tridiag( n );

[ XLtr , tr] = LDLTrovnice( E , b );
[ Xsdtr, ksdtr, r, tsdtr ] = steepestDescent( E , b , x0 ,tol, maxIt );
[ Xjtr ,kjtr , etr, tjtr , pr ] = JACOBI2( E, b, x0, tol );

% Matlabovske reseni
timerMtr = tic;
x2rs_Matlab = E\b;
timesMtr = toc(timerMtr);

figure('Name','tridiagonalni matice')
scatter (tr ,1:n);       % LDLT rychlost
hold on
scatter (tsdtr,1:ksdtr); % zobrazuje rychlost SD
scatter (tjtr,1:kjtr);   % rychlost jacobi
scatter (timesMtr,n);    % matlab rychlost

xlabel('cas');
ylabel('velikost');
legend('LDLT', 'SD','jacobi','MATLAB');
grid on




