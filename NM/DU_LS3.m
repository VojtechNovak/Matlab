xj = [-3 -2 -1 0];
fj = [1 0 -1 0];
m = length(xj);

A = [m,sum(xj);sum(xj),sum(xj.^2)];
b = [sum(fj);sum(xj.*fj)];
alfa = A\b;

xmin = min(xj);
xmax = max(xj);
delka = xmax-xmin;

x = xmin:(delka/100):xmax;
f1 = alfa(1)+alfa(2)*x;

plot(xj,fj,'bx',x,f1,'r')