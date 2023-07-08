function xmin = penalta1(uloha, x0, tol, rho)
% xmin = penalta1(uloha, x0, tol, rho)
%
% metoda kvadraticke penalty pro reseni ulohy
%             min{ f(x): g(x) <= 0 } 
%
% tuto ulohu prevedeme na ulohu 
%         min{ theta(x) }, 
% kde theta(x) = f(x) + 1/2*rho*(a(x))^2
% kde a(x) = max{0, g(x)}
%
% xmin ... reseni ulohy
%
% uloha ... volba ulohy (tj. f, g, a, potazmo theta)
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku
% rho ... velikost penalty

addpath('supp_fun')

[theta, dtheta, sol] = vyber_ulohu(uloha, rho);

% minimalizace metodou nejvetsiho spadu s globalni strategii
xmin = gradient_global(theta, dtheta, x0, tol);

fprintf("nalezene reseni: [ %f, %f ]\n", xmin)
ns = norm(sol);
if ns > 1e-13
    fprintf("relativni chyba reseni: %1.3e\n", norm(xmin - sol)/ns)
else
    fprintf("absolutni chyba reseni: %1.3e\n", norm(xmin - sol))
end





