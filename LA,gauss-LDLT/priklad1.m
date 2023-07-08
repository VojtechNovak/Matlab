
L = 1; % delka struny
f = @(x)-ones(size(x)); % funkce hustoty pusobicich sil
n = 10; % pocet uzlu je n+1 (cislujeme od nuly)

[A,b] = sestav_strunu(n,L,f);

% vyres soustavu
uh = A\b;
%uh = moje_gaussovka(A,b);

disp(['- chyba reseni soustavy: ' num2str(norm(A*uh - b,2))])

% dopln okrajovou podminku
uh = [0;uh;0];

% vykresli reseni
xh = 0:(L/n):L;

figure
hold on
title('pruhyb struny')
plot(xh,uh,'bo-')
plot(xh,xh.^2/2 - L/2*xh,'r*-')
xlabel('x')
ylabel('u(x)')
legend('metoda siti','analyticke reseni')
hold off



