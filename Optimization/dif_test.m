fun = 6; x0 = [1 ; 1]; tol = 0.00001;
% [xmin, it] = newton_diference(fun, x0, tol)
%
% minimalizuje funkci f(x) Newtonovou metodou
% gradient i Hessian aproximovan pomoci diferenci
%
% xmin ... minimum
% it ... pocet iteraci
%
% fun ... volba funkce f
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku

addpath('supp_fun')

vykresli = 0;
f =  vyber_funkci(fun, vykresli);

it = 0;
x = x0;
n = length(x);
g = zeros(n,1);
H = zeros(n);

I = eye(n);
epsi = tol;
h_g = sqrt(epsi) * ( 0.1 + abs(x) ); % h pro aproximaci gradientu
h_H = epsi^(1/3) * ( 0.1 + abs(x) ); % h pro aproximaci Hessianu

% gradient
for i = 1 : n
    g(i) = ( f(x + h_g(i)*I(:,i)) - f(x) ) / h_g(i);
end

% Hessian
for i = 1 : n
    for j = 1 : n
        grad_i_eps = ( f(x + h_H(j)*I(:,j) + h_H(i)*I(:,i)) - f(x + h_H(j)*I(:,j)) ) / h_H(i);
        H(i,j) = ( grad_i_eps - g(i) ) / h_H(j);
    end
end
H = ( H + H' ) / 2; % symetrizace
h = -H \ g;
xn = x + h;
% alternativne: (1) norm(fxn - fx) >= tol, (2) norm(xn - x) >= tol, norm(g) >= tol 
res(1) = norm([4;2] - xn);
while norm(x - xn) >= tol 
    it = it + 1;
    h = -H \ g;
    xn = x;
    x = x + h;
    
    h_g = sqrt(epsi) * ( 0.1 + abs(x) ); % h pro aproximaci gradientu
    h_H = epsi^(1/3) * ( 0.1 + abs(x) ); % h pro aproximaci Hessianu
  
    % gradient
    for i = 1 : n
        g(i) = ( f(x + h_g(i)*I(:,i)) - f(x) ) / h_g(i);
    end

    % Hessian
    for i = 1 : n
        for j = 1 : n
            grad_i_eps = ( f(x + h_H(j)*I(:,j) + h_H(i)*I(:,i)) - f(x + h_H(j)*I(:,j)) ) / h_H(i);
            H(i,j) = ( grad_i_eps - g(i) ) / h_H(j);
        end
    end
    H = ( H + H' ) / 2; % symetrizace
    res(it) =  norm([4;2] - x);
end

xmin = x;
