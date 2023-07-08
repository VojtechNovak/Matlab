function [xmin, it_out] = penalta2(uloha, x0, tol, rho)
% [xmin, it_out] = penalta2(uloha, x0, tol, rho)
%
% "sekvencni" metoda kvadraticke penalty pro reseni ulohy 
%             min{ f(x): g(x) <= 0 } 
%
% tuto ulohu prevedeme na ulohu 
%         min{ theta(x) }, 
% kde theta(x) = f(x) + 1/2*rho*(a(x))^2
% kde a(x) = max{0, g(x)}
%
% xmin ... reseni ulohy
% it_out ... pocet vnejsich iteraci, tj. pocet minimalizaci funkce theta
%
% uloha ... volba ulohy (tj. f, g, a, potazmo theta)
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku
% rho ... pocatecni velikost penalty

addpath('supp_fun')

[theta, dtheta, sol] = vyber_ulohu(uloha, rho);

if tol < 1e-1
    epsi = 1e-1;
else
    epsi = 100*tol;
end

% minimalizace metodou nejvetsiho spadu s globalni strategii
x = gradient_global(theta, dtheta, x0, epsi);

alfa = 10;
it_out = 1;
while epsi > tol
     
    rho = alfa * rho;
    epsi = epsi / alfa;
    [theta, dtheta] = vyber_ulohu(uloha, rho);
    
    % minimalizace metodou nejvetsiho spadu s globalni strategii
    x = gradient_global(theta, dtheta, x, epsi);
    
    it_out = it_out + 1;
end

xmin = x;

fprintf("nalezene reseni: [ %f, %f ]\n", xmin)
ns = norm(sol);
if ns > 1e-13
    fprintf("relativni chyba reseni: %1.3e\n", norm(xmin - sol)/ns)
else
    fprintf("absolutni chyba reseni: %1.3e\n", norm(xmin - sol))
end
fprintf("pocet vnejsich iteraci: %d\n", it_out)
fprintf("posledni rho pouzite pro gradientni metodu: %1.2e\n", rho)



