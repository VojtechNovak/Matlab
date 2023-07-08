function [A,b] = sestav_strunu(n,L,f_fun)

h = L/n;
xh = h*(1:n-1)';
f = f_fun(xh);

e = ones(n-1,1);
A = spdiags([-e 2*e -e],[-1 0 1], n-1, n-1);
b = h^2*f;

end

