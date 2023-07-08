function [ x ,k] = jacobi( A, b, x0, eps )
%JACOBI Summary of this function goes here
%   Detailed explanation goes here

[n, n] = size(A) ;

cond = true;
xprev = x0;
xnew = zeros( n, 1 );
k=0;

r_init = norm(b-A*x0);

while norm(b-A*xnew)/r_init > eps 
    for i = 1:n
        xnew(i) = 0;
        for j = 1:i-1
            xnew(i) = xnew(i) + A(i,j)*xprev(j);
        end
        for j = i+1:n
            xnew(i) = xnew(i) + A(i,j)*xprev(j);
        end
        xnew(i) = (b(i)-xnew(i))/A(i,i);
    end
    %cond = (norm(xnew - xprev)/norm(xprev) > eps);
   % cond = (norm(b-A*xnew)/r_init > eps);
    xprev = xnew;
    k = k+1;
end

x = xnew;
end

