function [xmin, it, res] = gradient_halving(fun, x0, tol)
% [xmin, it] = gradient_halving(fun, x0, tol)
%
% minimalizuje funkci f(x) gradientni metodou
%
% xmin ... minimum
% it ... pocet iteraci
%
% fun ... volba funkce f
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku

addpath('supp_fun')

vykresli = 0;
[f, df] =  vyber_funkci(fun, vykresli);

%%% korekce normy gradientu
function gnorm = get_gnorm(g)
    epsi = 1e-12;
    gnorm = norm(g);
    if gnorm <= epsi; gnorm = epsi; end 
end

%%% linesearch pro vypocet nove iterace 
function [xn, fxn] = linesearch_halving(x, fx, d)
    t = 1;
    xn = x + t*d; 
    fxn = f(xn);
    
    while fxn >= fx
        t = t / 2;
        xn = x + t*d;
        fxn = f(xn);
    end
end

%%% METODA NEJVETSIHO SPADU

x = x0;  
fx = f(x);
g = df(x);
d = -g / get_gnorm(g); % jednotkovy smer nejvetsiho rustu

[xn, fxn] = linesearch_halving(x, fx, d);

it = 1;
res(1) = norm([4;2] - xn);
% alternativne: (1) norm(fxn - fx) >= tol, (2) get_gnorm(g) >= tol
while norm(g) >= tol 
    x = xn;
    fx = fxn;
    g = df(x);
    d = -g / get_gnorm(g); % jednotkovy smer nejvetsiho rustu

    [xn, fxn] = linesearch_halving(x, fx, d);
    
    it = it + 1;
    res(it) =  norm([4;2] - xn);
end

xmin = xn;

end