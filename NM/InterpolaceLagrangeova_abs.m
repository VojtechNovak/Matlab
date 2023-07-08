function InterpolaceLagrangeova_abs()

N = 100;
 

for n=1:N
    x = -5:(10/n):5;
    
    f = abs(x);
    
    xx = -5:0.1:5;
    fn = xx; fn(:) = 0;
    for j=0:n
        Lj = xx; Lj(:) = 1;
        for k=0:n
            if j==k
                continue;
            end
            Lj = Lj .* ((xx-x(k+1)))./(x(j+1)-x(k+1));
        end
        fn = fn + f(j+1)*Lj;
    end
    n
    plot(xx,fn,'r',xx,abs(xx),'k')
    pause
end