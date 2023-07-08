function prikladLagrangeovaInterpolace()

% f = @(x) (sin(pi*x));
% x0 = -1; xn = 1;

f = @(x) (1./(1+x.^2));
x0 = -5; xn = 5;

xx = x0:0.001:xn;
plot(xx,f(xx),'r');
pause

for n=1:40
    i=0:n;
    x = x0+((xn-x0)/n)*i;
    ff = xx; ff(:) = 0;
    for j=0:n
        Lj = xx; Lj(:) = 1;
        for k=0:n
            if k==j
                continue;
            end
            Lj = Lj.*((xx-x(k+1))./(x(j+1)-x(k+1)));
        end
        ff = ff + f(x(j+1))*Lj;
    end
    n
    chyba = max(abs(ff-f(xx)))
    hold on
    plot(xx,ff,'b')
    pause(0.5);
end