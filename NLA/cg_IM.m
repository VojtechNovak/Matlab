function [ u, i, residuals ] = cg_IM( A, b, u0,it)
u = u0
r = b - A*u;
d = r;
n = it;

for i = 1:n
    v = A*d;
    alpha = (r'*d) /(d'*v );
    u = u + alpha * d;
    r = r - alpha * v;
    beta = - (r' * A * d) / (d'*v );
    d = r + beta * d;
    
    residuals( i ) = norm(r);
end


end