function IN1 = slozeneLichobeznikovePravidlo(f,a,b,N)

H = (b-a)/N;
ksik = a:H:b;

IN1 = H * (sum(feval(f,ksik)) - ...
    0.5*(feval(f,ksik(1))+feval(f,ksik(N+1))));
end