function [xmin, it] = newton_global(fun, x0, tol)
% [xmin, it] = newton_global(fun, x0, tol)
%
% minimalizuje funkci f(x) Newtonovou metodou
% Newtonuv krok spocten pomoci GEM
% zajistuje globalni konvergenci a pozitivni defitnost Hessianu
%
% xmin ... minimum
% it ... pocet iteraci
%
% fun ... volba funkce f
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku

addpath('supp_fun')

vykresli = 1;
[f, df, ddf] =  vyber_funkci(fun, vykresli);

function smin = gershgorin(H)
    % odhadne spodni hranici spektra symetricke matice H
    r = sum(abs(H),2) - diag(abs(H)); 
    smin = min(diag(H) - r);
end

function H = Hessian_SPD(H)
    % zajistime pozitivni definitnost Hessianu
    
    %smin = min(eig(H));
    smin = gershgorin(H);
        
    if abs(smin) <= 1e-10
        H = H + 0.1*eye(size(H));
    elseif smin < -1e-10
        H = H + (-smin + 0.1)*eye(size(H));
    end
    %eig(H)'   
end

function lambda = wolfe(f, df, g, x, h)
    % Wolfe: vylouceni prilis dlouhych a kratkych kroku
    
    % koeficienty pro Wolfeovy podminky:
    koef = 0.9;    alfa = 0.05;     beta = 0.95;
    
    lambda = 1;
    
    too_long = f(x+lambda*h) > f(x) + alfa*lambda*g'*h;
    too_short = df(x+lambda*h)'*h < beta*g'*h;    
    while  too_long || too_short   
      if too_long
         lambda = lambda * koef;
      else
         lambda = lambda / koef;
      end
      too_long = f(x+lambda*h) > f(x) + alfa*lambda*g'*h;
      too_short = df(x+lambda*h)'*h <= beta*g'*h; 
    end   
end

x = x0;
fx = f(x);
g = df(x);

H = Hessian_SPD(ddf(x)); 
h = -H \ g;

lambda = wolfe(f, df, g, x, h);  
xn = x + lambda*h;
fxn = f(xn);

it = 1;

% alternativne: (1) norm(g), (2) norm(xn - x) >= tol 
while norm(fxn - fx) >= tol 
    x = xn;
    fx = fxn;
    g = df(x);

    H = Hessian_SPD(ddf(x)); 
    h = -H \ g;
    
    lambda = wolfe(f, df, g, x, h);  
    xn = x + lambda*h;
    fxn = f(xn);
    
    it = it + 1;
end

xmin = x;

end