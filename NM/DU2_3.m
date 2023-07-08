% funkce f a jeji prvni dve derivace
f= @(x) sin(x);
f1 = @(x) cos(x);
f2 = @(x) 9*exp(-3*x);
x = linspace(1,2,100);
y = f(x);
y1 = f1(x);
y2 = f2(x);
FI = (abs(y.* y2))./(y1.^2);
max(FI)
% konvergence je zarucena kontraktivitou FI
% podíl je menší než 1 pro každé x z intervalu <1,2>
x0 = pi/4;
x1 = x0-(f(x0))/(f1(x0));
x2 = x1-(f(x1))/(f1(x1));