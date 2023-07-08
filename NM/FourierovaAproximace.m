function FourierovaAproximace()

syms x
f = x.^3;
n = 50;

fn = 0;

figure
xx = 0:0.01:2*pi;
plot(xx,eval(subs(f,xx)),'r');
for j=0:n
    alfaj = int(f*exp(-i*j*x),x,0,2*pi)
    fn = fn + (alfaj/(2*pi))*exp(i*j*x);
    hold on;
    plot(xx,real(eval(subs(fn,xx))));
    pause(.001)
end