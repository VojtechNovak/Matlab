function [t,u] = doprednaEulerovaMetoda(f,u0,h,t0,N)

t = t0:h:(t0+h*N);
u = t; u(:) = 0;

u(1) = u0;
for n=1:N
    u(n+1) = u(n) + h*f(t(n),u(n));
end