function [ x ,k , e ] = JACOBI2( A, b, x0, tol )
%JACOBI Resi iteracne system Ax=b pomoci Jacobiho metody
%   A by mela byt diagonalne dominantni matice

[n, ~] = size(A) ;
x = x0;
xnew = zeros( n, 1 );
k=0;

r_init = norm(b-A*x0);

pr = norm(b-A*xnew)/r_init;

while pr > tol
    convergence = true;
    for i = 1 : n
        Sum = 0;
        for j = 1 : n
            if j ~= i
                Sum = Sum + A(i,j)*x(j);
            end
        end
        xnew(i) = -1/A(i,i) * (Sum - b(i));
        if abs(xnew(i) - x(i)) > tol
            convergence = false;
        end
    end
    if convergence
        break
    end
    k = k+1;
    e(k) = abs(xnew(i) - x(i)); % uklada chybu pri kazde iteraci
    x = xnew;
    pr(k) = pr;
end
end