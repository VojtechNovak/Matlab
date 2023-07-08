function [xmin, it, res] = bfgs(fun, x0, tol)
% [xmin, it] = bfgs(fun, x0, tol)
%
% minimalizuje funkci f(x) metodou bfgs (kvazi-Newtonova metoda)
%
% xmin ... minimum
% it ... pocet iteraci
%
% fun ... volba funkce f
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku

addpath('supp_fun')

vykresli = 0;
[~, df, ddf] =  vyber_funkci(fun, vykresli);

x = x0;
g = df(x);
H = eye(length(x),length(x));
xp = [0;0];
it = 0;
% alternativne: (1) norm(fxn - fx) >= tol, (2) norm(xn - x) >= tol, norm(g) > tol
res(1) = norm([4;2] - x);
while norm(g) >= tol
  % kvazi-Newtonuv krok
  h = -H \ g;
  
  xn = x + h;
  gn = df(xn);

  % konstrukce BFGS aproximace Hessianu
  s = xn - x;
  y = gn - g;
  if y'*s > eps      
      H = H + (y*y')/(y'*s) - (H*s*s'*H)/(s'*H*s);
  end
  
  % test aproximace
  fprintf("chyba aproximace Hessianu: %f\n", norm(H - ddf(xn))/norm(ddf(xn)));
  xp = x;
  x = xn; 
  g = gn; 
  
  it = it + 1;
  res(it) = norm([4;2] - x);
end

xmin = xn;

