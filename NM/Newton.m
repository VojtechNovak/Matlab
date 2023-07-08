function [x,k,historiefx,historiex] = Newton(f,df,x0,epsil)

k = 0;
x = x0;
fx = f(x);
historiefx(k+1) = fx;
historiex(k+1) = x;

while abs(fx)>epsil
    x = x - fx/df(x);
    fx = f(x);
    k = k+1;
    historiefx(k+1) = fx;
    historiex(k+1) = x;
end