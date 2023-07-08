n = 500;
A = gen_SPD(n);
x0 = ones( n, 1 );
b = randi([1,9],n,1);
%% Priklad 1

% Zavolame vami vytvorenou funkci:
[ x, k ] = gauss_seidel( A, b, x0, 1e-12 );  

[ x1, k1 ] = Richardson( A, b,x0,1e-12,1000 );  
% Otestujeme, zda je reseni v poradku:
x_Matlab = A\b;
n = norm( x - x_Matlab); 
n1 = norm( x1 - x_Matlab);
if ( n < 1e-8 )
  fprintf('Vase funkce gauss_seidel pravdepodobne pracuje spravne.\n\n');
else
  fprintf('Ve funkci gauss_seidel nejspis chyba.\n\n');
end


if ( n1 < 1e-8 )
  fprintf('Vase funkce Richardson pravdepodobne pracuje spravne.\n\n');
else
  fprintf('Ve funkci Richardson nejspis chyba.\n\n');
end

%% Priklad 2
[ x_Jac_1, k_Jac_1 ] = jacobi( A, b, x0, 0.01 );
[ x_Jac_2, k_Jac_2 ] = jacobi( A, b, x0, 0.0001 );
[ x_Jac_3, k_Jac_3 ] = jacobi( A, b, x0, 1e-8 );

[ x_GS_1, k_GS_1 ] = gauss_seidel( A, b, x0, 0.01 );
[ x_GS_2, k_GS_2 ] = gauss_seidel( A, b, x0, 0.0001 );
[ x_GS_3, k_GS_3 ] = gauss_seidel( A, b, x0, 1e-8 );

[ x_R_1, k_R_1 ] = Richardson( A, b,x0,0.01,1000 );
[ x_R_2, k_R_2 ] = Richardson( A, b,x0,0.0001,1000 );
[ x_R_3, k_R_3 ] = Richardson( A, b,x0,1e-8,1000 );

fprintf("Pocty iteraci Jacobiho metody: \n");
disp( [ k_Jac_1, k_Jac_2, k_Jac_3 ] );
fprintf("Pocty iteraci Gaussovy-Seidelovy metody: \n");
disp( [ k_GS_1, k_GS_2, k_GS_3 ] );
fprintf("Pocty iteraci Richardsonovy metody: \n");
disp( [ k_R_1, k_R_2, k_R_3 ] );