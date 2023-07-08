%% 1, testovaci matice pro LDLT rozklad

% a, symetricka matice
n = randi([3,50]);                  % nahodna velikost matice, napr od 3 do 50
A = toeplitz(randi([0 9],n,1));     % generovani nahodne symetricke matice s celymi cisly od 0 do 9
tf = issymmetric(A);                % overeni jestli je symetricka
if tf == 0
    error('matice A neni symetricka')
end

%% b, symetricka ridka matice
B = sprandsym(A);
spy(B);

%% c, tridiagonalni matice
e = randi(9,n,1);
C = spdiags( [e 5*e e], [-1 0 1], n - 2, n - 2 );

%% 2, matice pro Jacobiho metodu a metodu nejvetsiho spadu

% symetricka diagonalne dominantni matice
U = triu( randi([0 9],n));
D = 1000 * randi([1 9], n, 1 );      % diagonala matice... napr 1000 krat vetsi
M = diag( D ) + U + U';


%Diagonally dominant
      for m = 1 : n
          row = abs(M(m,:));
          d = sum(row) - row(m);
          if row(m) <= d
              error('[M] neni diagonalne dominantni')
          end
      end


