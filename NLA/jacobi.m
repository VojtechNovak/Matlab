function [ x ,k ] = jacobi( A, b, x0, tol )
%JACOBI Resi iteracne system Ax=b pomoci Jacobiho metody
%   A by mela byt diagonalne dominantni matice

[n, ~] = size(A) ;

xprev = x0;
xnew = zeros( n, 1 );
k=0;

r_init = norm(b-A*x0);


while norm(b-A*xnew)/r_init > tol
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
    xprev = xnew;
    
    k = k+1;
end

x = xnew;

end

