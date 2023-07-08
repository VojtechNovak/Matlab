function [ A ] = gen_symmetric( n )

v = randi([10 19],n,1);      % o neco vetsi cisla na diagonale, aby nevznikly nulove prky
M = tril(randi([1 9],n),-1);
A = M + M' + diag(v);    % generovani nahodne symetricke matice s celymi cisly od 1 do 9

tf = issymmetric(A);                % overeni jestli je symetricka

if tf == 0
    error('matice A neni symetricka')
end

end