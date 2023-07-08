function [ x, k, residuals ] = cg( A, b, x0, tol, maxIt )
%CG Solves the system Ax=b with SPD matrix A.
% A system matrix
% b RHS vector
% x0 initial approximation
% tol relative accuracy
% maximum number of iterations

% iteration counter
k = 0;

% initial residual and direction vector
x = x0;
r = b - A*x;
d = r;
residuals( 1 ) = norm(r);

% for storing r_{k+1}'*r_{k+1}
delta_new = r' * r;
% for storing r_{k}'*r_{k}
delta_old = 0;

% for stopping criterion computation
r_init = norm( b - A * x0 );

% main loop
while ( k < maxIt && ( norm( b - A * x ) / r_init > tol ) )
  % compute new x_{k+1} and r_{k+1}
  q = A*d;
  alpha = delta_new / ( d' * q );
  x = x + alpha * d;
  r = r - alpha * q;
  
  % compute d_{k+1}
  delta_old = delta_new;
  delta_new = r' * r;
  beta = delta_new / delta_old;
  d = r + beta * d;
   
  % increase iteration counter
  k = k + 1;
  residuals( k ) = norm(r);
end

end
