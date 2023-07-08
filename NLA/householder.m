function [ P ] = householder( x )
%HOUSEHOLDER Vraci matici Householderovy transformace nulujici prvky 2:end
%vektoru v
%   v vstupni vektor
%   P matice zrcadleni (Householderova matice)

if nargin~=1
  error("Spatny pocet vstupnich argumentu");
end

n = length( x );
e1 = zeros( n, 1 ); 
e1( 1 ) = 1.0;

v = -sign( x(1) ) * norm( x ) * e1 - x;
P = eye( n ) - 2.0 *  (v * v') / (v' * v);

end

