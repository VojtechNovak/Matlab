function [ A ] = gen_tridiag( n )

%vytvori ridkou matici s nahodnymi celymi cisly(od 1 do 9) na diagonale o velikosti d (-1 0 1),
% kde 0 je hlavni diagonala, o velikosti m , n.

% Prikaz umisti j-ty sloupec z matice B(:,j) na j-tou diagonálu d
% A = spdiags ( B , d , m , n )

e = randi(9,n,1);
B = [e 20*e e];
A = spdiags( B, -1:1, n , n );

end