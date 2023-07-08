%% 
% DEFINE [A] and [b]

A = [ 8 2 3 1 ;
      0 6 4 0 ;
      2 3 9 3 ;
      1 2 3 7 ];
  
  b = [ 25;24;47;42];
  
  tol = 1e-6;
  
  [M,N] = size(A);
  if M~=N
      error('A neni ctvercova matice');
  end
      %Diagonally dominant
      for m = 1 : M
          row = abs(A(m,:));
          d = sum(row) - row(m);
          if row(m) <= d
              error('[A] neni diagonalne dominantni')
          end
      end
      
      %ODHAD
      x = ones(M,1);
      
      %Diagonalni matice
      D = diag(diag(A));
      
      ITER = 0;
      err = inf;
      while err > tol
          dx = D\(b - A*x);
          x = x + dx;
          ITER = ITER + 1;
          err = max(abs(dx./x));
      end
      
      
      
      
      
      
      
      
      
      
      