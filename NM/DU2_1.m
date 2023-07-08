%% inicializace
A = [6 2 ; 2 3];
b = [0;1];
x0 = [0;0];

r0 = b - A*x0;
a0 = (r0'*r0)/(r0'*A*r0);
%% prvni iterace
x1 = x0 + a0 * r0;
r1 = b - A * x1;
a1 = (r1'*r1)/(r1'*A*r1);
%% druha iterace 
x2 = x1 + a1 * r1;
r2 = b - A * x2;
a2 = (r2'*r2)/(r2'*A*r2);
%% relativni norma rezidua
norm(r2)/norm(r0)

x3 = x2+a2*r2;
A\b