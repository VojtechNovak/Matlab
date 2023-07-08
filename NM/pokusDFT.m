dx = 0.001;
L = pi;
x = (-1+dx:dx:1)*L;
f = x.^3;

n = 5;

fn = 0;

figure
xx = 0:0.01:2*pi;
plot(xx,eval(subs(f,xx)),'r');
for j=0:n
    alfaj = symsum(f*((2*pi*k/n)-pi)*exp(-i*j*x*k/n)*((2*pi*k/n)-pi) ,k,0,n-1);
    fn = fn + (alfaj/(2*pi))*exp(-i*j*x*k/n);
    hold on;
    plot(xx,real(eval(subs(fn,xx))));
    pause(.001)
end