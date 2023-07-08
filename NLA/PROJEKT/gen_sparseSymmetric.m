function [ A ] = gen_sparseSymmetric( n , d )

% vytvori ridkou symetrickou matici s velikosti n a hustotou m

A = sprandsym(n,d);

v = randi([1 5],n,1);

d = diag(v);

A = A+d;          % osetreni nulovych prvku na diagonale

A = sparse(A);


end