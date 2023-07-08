function [xmin, it] = gradient_global(f, df, x0, tol)
% [xmin, it] = gradient_global(f, df, x0, tol)
%
% minimalizuje funkci f(x) gradientni metodou
% linesearch realizuje zlatym rezem
% globalizacni strategie: 1. Wolfeova podminka (krok neni prilis dlouhy)
%
% xmin ... minimum
% it ... pocet iteraci
%
% fun ... volba funkce f
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku


%%% korekce normy gradientu
function gnorm = get_gnorm(g)
    epsi = 1e-12;
    gnorm = norm(g);
    if gnorm <= epsi; gnorm = epsi; end 
end

function lambda = wolfe_first(f, g, x, h)
    % Wolfe, 1. podminka: vylouceni prilis dlouhych kroku
    
    % koeficienty pro 1. Wolfeovu podminku
    koef = 0.9;    alfa = 0.05;    
    
    lambda = 1; 
    while  f(x+lambda*h) > f(x) + alfa*lambda*g'*h  
         lambda = lambda * koef;
    end   
end

%%% METODA NEJVETSIHO SPADU

x = x0;  
g = df(x);
normg = get_gnorm(g);

it = 0;

% alternativne: (1) norm(fxn - fx) >= tol, (2) norm(xn - x) >= tol
while normg >= tol 
    
    d = -g / normg; % jednotkovy smer nejvetsiho poklesu

    t = zlatyrez(f, 0, 1, x, d, tol); % linesearch

    % 1. Wolfeova podminka (krok neni prilis dlouhy)
    h = t*d;
    lambda = wolfe_first(f, g, x, h);

    x = x + lambda*h;    
    g = df(x);
    normg = get_gnorm(g);
   
    it = it + 1;
end

xmin = x;

end
