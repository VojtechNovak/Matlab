function [chyba1, chyba2] = test(m)
%TEST porovna reseni soustavy s dolni trojuhelnikovou matici pomoci primeho
%resice a reseni pomoci Jacobiho iteracni metody s "presnym" resenim pomoci
%vnitrni funkce Matlabu. 
% vstupnim parametrem je m ... dimenze ulohy
% vystupnim parametrem jsou chyba1, chyba2 ... odchylky od "presneho" reseni 

    % vygenerujeme symetrickou matici A radu m
    A = rand( m, m );
    A = A + A'; 
    % Zajistime, aby matice byla ostre diagonalne dominantni
    max_row_sum = norm( A, Inf );
    for j = 1 : m
      A( j, j ) = 2.0 * max_row_sum;
    end

    %%% DOPLNTE: 
    L =   tril(A);          %%% VYGENERUJTE DOLNI TROJUHELNIKOVOU CAST Z MATICE A
    b =   rand(m,1);         %%% VYGENERUJTE VEKTOR VELIKOSTI m

    % zavolame funkci fsubst 
    x_fsubst = fsubst(L, b);
    
    % zavolame funkci jacobi
    x_jacobi = jacobi (L, b);
    
    
    %%% DOPLNTE: 
    x_matlab =  A\b;     %%% VYGENERUJTE KONTROLNI PRESNE RESENI POMOCI VNITRNI FUNKCE MATLABU
    
    %%% ZDE OTESTUJTE, JAK PRESNA RESENI JSTE OBDRZELI VE SROVNANI S PRESNYM RESENIM: 
    chyba1 = norm(x_fsubst - x_matlab);      %%% DOPLNTE TEST PRO x_fsubst
    chyba2 = norm(x_jacobi - x_matlab);   %%% DOPLNTE TEST PRO x_jacobi
    

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function x = fsubst( L, b )
    %FSUBST Resi soustavu s dolni trojuhelnikovou matici L a vektorem b
    % Pouziti: x = fsubst( L, b )

        [ m, ~] = size( L ); 
        x = zeros( m, 1 );

        %%% DOPLNTE VYPOCET PRVNIHO PRVKU VEKTORU RESENI
        x( 1 ) = b( 1 ) / L( 1, 1 );   %%% DOPLNTE

        % zbyvajici prvky
        for i = 2 : m
          if L( i, i ) ~= 0
            x( i ) = ( b( i ) - L( i, 1 : i - 1 ) * x( 1 : i - 1 )) / L( i, i ); 
          else 
            error('Matice ma nulovy diagonalni prvek!');
          end
        end

    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    function x  = jacobi( A, b)
    %JACOBI Resi iteracne system Ax=b pomoci Jacobiho metody
    % A by mela byt diagonalne dominantni matice
    
    [m, ~] = size(A) ;

    %%% ZDE DOPLNTE, CO JE POTREBA
    x0 = ones(m , 1 );          %%% DOPLNTE
    tol = 1e-5 ;               %%% DOPLNTE
    xprev = x0;
    xnew = zeros( m, 1 );

    r_init = norm(b-A*x0);

    while norm(b-A*xnew)/r_init > tol
        for i = 1:m
            xnew(i) = 0;
            for j = 1:i-1
                xnew(i) = xnew(i) + A(i,j)*xprev(j);
            end
            for j = i+1:m
                xnew(i) = xnew(i) + A(i,j)*xprev(j);
            end
            xnew(i) = (b(i)-xnew(i))/A(i,i);
        end
        xprev = xnew;
    end

    x = xnew;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end