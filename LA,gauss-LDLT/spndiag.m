function A=spndiag(x,d,m,n)

A=spdiags(ones(m,1)*x,d,m,n);
