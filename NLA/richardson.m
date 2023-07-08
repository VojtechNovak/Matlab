function [ x, k, residuals ] = richardson( A, b, x0, eps )
%RICHARDSON Resi soustavu rovnic pomoci Richardsonovy metody

[n, n] = size(A) ;
r_init = norm(b-A*x0);
xprev = x0;
x=xprev;

% optimalni omega
lambda_max =  eigs(A,1,'largestabs');
lambda_min =  eigs(A,1,'smallestabs');
omega = 2 / (lambda_max + lambda_min)

k = 0;

residuals = [r_init];

while norm(b-A*x)/r_init > eps 
    x = xprev + omega*(b-A*xprev);
    xprev = x; 
    k = k+1;
    
    residuals = [ residuals, norm(b-A*x) ];
end

end

