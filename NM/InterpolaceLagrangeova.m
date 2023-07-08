function InterpolaceLagrangeova()

N = 100;
x = 0:1:N;
f = rand(N+1,1);

for n=0:N
    xx = 0:0.1:n;
    fn = xx; fn(:) = 0;
    for j=0:n
        Lj = xx; Lj(:) = 1;
        for k=0:n
            if j==k
                continue;
            end
            Lj = Lj .* ((xx-x(k+1)))./(x(j+1)-x(k+1));
        end
        plot(xx,Lj)
        hold on;
        fn = fn + f(j+1)*Lj;
    end
    pause
    hold off
    plot(xx,fn,'r',x(1:(n+1)),f(1:(n+1))','kx')
    pause
end