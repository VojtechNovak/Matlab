% NLA1 - miniprojekt 1
%
% Jmeno:
% Login:
% Datum: 

%% Priklad 1
% Pomoci prikazu "help tril" a "help triu" zjistete, k cemu slouzi funkce tril a
% triu. Popiste strucne v komentari nize.
% tril:  
% triu:

% Pomoci funkce rand vygenerujte matici A nahodnych cisel o rozmeru 4 x 4:
A = 

% Ulozte do matice L dolni trojuhelnikovou cast matice A (vse pod hlavni
% diagonalou, bez hlavni diagonaly) a do matice U horni trojuhelnikovou 
% cast matice A (vse nad hlavni diagonalou, bez hlavni diagonaly):
L = 
U = 

% Pomoci metody diag (viz help nebo prednaska) ulozte to vektoru d hlavni
% diagonalu matice A.
d = 
% Pomoci stejne metody vytvorte diagonalni matici D, jejiz hlavni diagonala 
% bude tvorena prvky vektoru d.
D = 

% Plati tedy A = L + D + U. Upravte nasledujici radek tak, abyste ziskali 
% matici B, ktera splnuje:
% 1. Prvky na hlavni diagonale B jsou prvky hlavni diagonaly A prenasobene -1.
% 2. Prvky nad hlavni diagonalou B vznikly umocnìním odpovidajicich prvku
% matice A na druhou (pro umocneni zvolte vhodne jeden z operatoru ^, nebo .^ 
% - chceme umocnit jednotlive prvky, ne celou matici).
% 3. Prvky pod hlavni diagonalou vzniknou vydelenim odpovidajicich prvku v
% matici A ctyrmi.
B = L + D + U;