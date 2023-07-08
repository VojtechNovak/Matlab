function [xmin, it] = zlatyrez(f, a, b, x, h, tol)
% [xmin, it] = zlatyrez(f, a, b, tol)
%
% nalezne minimum funkce f(x + t*h) na intervalu <a,b> metodou zlateho rezu
% minimalizujeme vzhledem k t
%
% xmin ... minimum
% it ... pocet iteraci
%
% f ... funkce f
% a, b ... meze intervalu
% x, h ... minimalizujeme f(x + t*h) vzhledem k t
% tol ... pozadovana presnost

gamma = (1 + sqrt(5)) / 2;

d = (b - a)/gamma + a;
c = a + b - d;

fc = f(x + c*h);
fd = f(x + d*h);

it = 0;

while b - a >= tol      
   if fc < fd
      b = d; 
      d = c; 
      c = a + b - d; 
      fd = fc;
      fc = f(x + c*h);    
   else	
      a = c; 
      c = d; 
      %d = a + b - c;
	  d = (b - a)/gamma + a;
      fc = fd; 
      fd = f(x + d*h);
   end
      
   it = it + 1;
end

xmin = (a + b) / 2;

