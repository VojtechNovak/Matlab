function K=blokdiag(A,n)
% funkce vyuziva zabudovanou funkci blkdiag k efektivnimu sestaveni blokove
% diagonalni matice ze vstupni matice A (n krat zopakovana na diagonale)

% funkce repmat(A, m, n) replikuje matici/skalar/string A v poli o
% rozmerech m krat n
s=repmat('A,',1,n-1); % vytvori string 'A,A,A,A,' atd.
s=[s,'A']; % za poslednim 'A' neni carka
s=['blkdiag(',s,');'];  % posklada s do retezce 'blkdiag(A,A,A,A,A);'

% pomoci funcke eval retezec zavolame jako funkci
K=eval(s);  
