function [ A ] = gen_SPD( n )

% symetricka diagonalne dominantni matice

U = triu( randi([0 9],n));

D = n*10 * randi([1 9], n, 1 );      % diagonala matice
A = diag( D ) + U + U';


% Diagonally dominant check
      for m = 1 : n
          row = abs(A(m,:));
          d = sum(row) - row(m);
          if row(m) <= d
              error('[M] neni diagonalne dominantni')
          end
      end
      
end