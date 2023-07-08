function IN0 = slozeneObdelnikovePravidlo(f,a,b,N)

H = (b-a)/N;
ksik = a:H:b;
stredy = 0.5*(ksik(1:N)+ksik(2:(N+1)));

IN0 = H * sum(feval(f,stredy));