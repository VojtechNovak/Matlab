dy = @(x,y) 1-y;
f = @ (x) 1+(1/2)*(exp(-4*x))-(1/2)*exp(-2*x); %% analyticke reseni
x0 = 0;
xn = 1;
y = 0;
h = 1/3;
fprintf ('x \t\t y (Euler) \t y (analyticke) \n')
fprintf ('%f \t %f\t %f\n', x0,y,f(x0));

for x = x0 : h : xn-h
    y = y + dy(x,y)*h;
    x = x+h;
    fprintf ('%f \t %f\t %f\n', x,y,f(x));
end
