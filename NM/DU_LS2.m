x =  linspace(-1,1,101);
f= @(x) sin((pi/2)*x);
g = @(x) x.^2;
h = @(x) x.*sin((pi/2)*x);

a = -1;
b = 1;
A = [2,0;0,integral(g,a,b)];
B = [integral(f,a,b);integral(h,a,b)];
alfa = A\B;

y=f(x);
f1 = alfa(1)+alfa(2)*x;

plot(x,y,'k')
hold on
plot(x,f1)