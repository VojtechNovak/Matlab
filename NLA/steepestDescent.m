function [ x, k, residuals ] = steepestDescent( A, b, x0, tol, maxIt )
%steepestDescent resi system rovnic Ax=b s pozitivne definitni matici A
% A ... matice
% b RHS vector
% x0 puvodni odhad
% tol ... relativni presnost
% maxIt maximalni pocet iteraci

%iteration counter
k = 0;

% itinial residual vector
x = x0;
r = b - A * x;
residuals( 1 ) = norm( r );

% for stopping criterion computation
r_init = norm( b - A * x0 );

% main loop
while ( k < maxIt && ( norm( b - A * x ) / r_init > tol) )
  % compute x_{k+1}
  alpha = ( r' * r ) / ( r' * A * r );
  x = x + alpha * r;
  
  % compute r_{k+1}
  r = r - alpha * A * r;
  
  % increase iteration counter
  k = k + 1;
  
  % store current residual
  residuals( k ) = norm( r ); % Norma rezidua(kazda iterace ulozi presnost do vektoru)
end

end

