function [u, it ]= Richardson_V(A,b,u0,tol,itmax)
u=u0;
it = 0;
r= b- A* u;
normr0= norm(r);
e = eigs(A);
lambda1 = e(1);
lambdaN = e(end);
omega = 2/(lambda1 + lambdaN)
if (itmax==0) itmax = inf;
end
while (norm(r)/ normr0 > tol) && (it< itmax)
u= u+ omega* r ;
r= b - A* u;
it = it + 1;
end
