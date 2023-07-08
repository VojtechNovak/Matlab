function [ Q, R ] = my_qr( A )
%MY_QR Funkce vytvari QR rozklad vstupni ctvercove matice A pomoci
%Householderovych transformaci
%   A   vstupni matice
%   Q   ortogonalni matice
%   R   horni trojuhelnikova matice

[ m, n ] = size( A );
if m~=n
  error("Matice neni ctvercova!")
end

Q = eye( m, m );
R = A;

for i = 1 : m
  % prochazime sloupce vstupni matice A postupne pomoci matic zrcadleni
  % nulujeme prvky pod diagonalou v danem sloupci
  P = eye( m, m );
  P( i : end, i : end ) = householder( R( i : end, i ) );
  Q = Q * P;
  R = P * R;
end


end

