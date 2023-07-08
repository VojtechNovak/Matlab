fun = 6; x0 = [1 ; 1]; tol = 0.00001;
% [xmin, it] = trust_region(fun, x0, c0, tol)
%
% minimalizuje funkci f(x) metodou Trust Region (kvazi-Newtonova metoda)
%
% xmin ... minimum
% it ... pocet iteraci
%
% fun ... volba funkce f
% x0 ... pocatecni iterace
% c0 ... pocatecni hodnota c (je neprimo umerna velikosti oblasti duvery) 
% tol ... presnost pro ukoncovaci podminku

addpath('supp_fun')

vykresli = 0;
[f, df, ddf] =  vyber_funkci(fun, vykresli);

c = 0.7;

x = x0;
fx = f(x);
g = df(x);
H = ddf(x);
n_H = size(H);
xp = [0;0];
it = 1;
res(1) = norm([4;2] - x);
% alternativne: (1) norm(fxn - fx) >= tol, (2) norm(xn - x) >= tol 
while (norm(x - xp) >= tol || norm(x - xp) == 0)

  % zkusebni krok
  h = -(H + c*eye(n_H)) \ g;
  
  % kvadraticky model funkce f 
  m = fx + g'*h + 1/2*h'*H*h;
  
  fxn = f(x + h);
  
  rho = (fx - fxn) / (fx - m);
  
  if rho >= 0.1
      xn = x + h;
      g = df(xn);
      H = ddf(xn);      
  else
      xn = x;
      fxn = fx;
  end      
  
  % uprava velikosti oblasti, na ktere ocekavame "dobrou" shodu fce s jejim modelem
  if rho > 0.75
    c = .5*c;
  elseif rho < 0.1
    c = 2*c;
  end
  
  xp =x;
  x = xn;
  fx = fxn;
  
  it = it + 1;
  res(it) = norm([4;2] - x);
end

xmin = x;


