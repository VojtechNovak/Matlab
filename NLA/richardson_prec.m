function [ x, k, residuals ] = richardson_prec( A, b, x0, M, eps )
%RICHARDSON_PREC Resi soustavu rovnic pomoci predpodminene Richardsonovy metody

[n, n] = size(A) ;
r_init = norm(b-A*x0);
xprev = x0;
x=xprev;

% optimalni omega
lambda_max =  eigs(inv(M)*A,1,'LM');
lambda_min =  eigs(inv(M)*A,1,'SM');
omega = 2 / (lambda_max + lambda_min);

k = 0;

residuals = [r_init];

while norm(b-A*x)/r_init > eps 
    rPrec = M \ (b-A*xprev); % inv(M)*(b-A*xprev)
    x = xprev + omega*rPrec;
    xprev = x; 
    k = k+1;
    residuals = [ residuals, norm(b-A*x) ];
end

end

