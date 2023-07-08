function [ L, D ] = my_ldlt( A )
%MY_LDLT Vypocita LDLT rozklad matice A
%   Input: A regularni symetricka matice A

[ m, n ] = size( A );

% zkontrolujeme velikost matice
if m ~= n
  error( 'Matice musi byt ctvercova!' );
end

L = eye( m );
D = zeros( m );

v = zeros( m, 1 );
v( 1 ) = A( 1, 1 );
D( 1, 1 ) = v( 1 );
L( 2 : n, 1 ) = A( 2 : n, 1 ) / v( 1 );

for j = 2 : n
  v( 1 : j - 1 ) = L( j, 1 : j - 1 )' .* diag( D( 1 : j - 1, 1 : j - 1 ) ); 
  
  v( j ) = A( j, j ) - L( j, 1 : j - 1 ) * v( 1 : j - 1);
  D( j, j ) = v( j );
  L( j + 1 : n, j ) = ( A( j + 1 : n, j ) - L( j + 1 : n, 1 : j - 1 ) * v( 1 : j - 1 ) ) / v( j ); 
  
end


end

