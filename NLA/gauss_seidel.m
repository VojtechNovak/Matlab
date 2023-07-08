function [ x ,k ] = gauss_seidel( A, b, x0, tol )
%gauss_seidel Resi iteracne system Ax=b pomoci gauss_seidel metody
%   A by mela byt diagonalne dominantni matice
[n, ~] = size(A) ;
xnew = zeros( n, 1 );
xprev = x0;

k = 0;
r_init = norm(b-A*x0);

 while norm(b-A*xnew)/r_init > tol
     
      for i = 1:n
         s=0;
         for j = 1: i-1
             s = s + A(i,j)*xnew(j);
         end
         for j = i+1:n
             s = s + A(i,j)*xprev(j);
         end
         xnew(i) = (b(i) - s ) / A(i,i);
      end
      xprev = xnew;
      k = k + 1;   
  end
    x = xnew;
end
