function [ A ] = gen_sparseSPD( n , d )

% vytvori ridkou symetrickou matici s velikosti n a hustotou m

A = sprandsym(n,d);

v = randi([n*10 n*10],n,1); % prvky na diagonale jsou 10x vetsi nez velikost matice
                            % aby si matice zachovala diagonalni dominanci
                            % i pri velkych maticich
d = diag(v);

A = A+d;          % osetreni nulovych prvku na diagonale

A = sparse(A);


end