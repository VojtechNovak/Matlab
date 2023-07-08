% Priklad 2. f(x) = atan(x), x0 = 1;
f = @(x) atan(x);
koren = 0;
df = @(x) 1./(1+x.^2);
x0 = 1; epsil = 1e-12;
[x,k,historiefx,historiex] = Newton(f,df,x0,epsil);
hold off
plot(log10(abs(historiex(1:end-1)-koren)),log10(abs(historiex(2:end)-koren))); axis equal
hold on; x = -8:2; plot(x,x,'r')
hold on; x = -8:2; plot(x,2*x,'g')
hold on; x = -8:2; plot(x,3*x,'b--')
hold on; x = -8:2; plot(x,atan(x),'k')