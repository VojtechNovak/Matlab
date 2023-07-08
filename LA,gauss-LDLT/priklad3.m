
A = [1 1 1; 2 1 1; 2 0 1];
b = [1;0;1];

x = moje_gaussovka(A,b);

disp(['toto ma byt nula: ' num2str(norm(A*x - b,2))])
