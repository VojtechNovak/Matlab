function sit1d(L,N)
%% popis ulohy
% L % delka struny
% N % pocet prvku site
n = N+1; % pocet uzlu
h = L/N; % krok site
x = (0:h:L)'; % souradnice uzlu
% -u??= f, u(0) =0, u(L)=0; % rovnice struny
% x z <0,L> % interval
% f = sin(x) % zatizeni
%% Sestaveni ridke matice A
e = ones (n -2 ,1);
A = spdiags ([-e 2*e -e], [-1 0 1], n -2, n -2);
%% vektor prave strany
b = eval ('h^2* sin(x(2: end -1))');
%% numericke reseni
u=A \b;
u =[0; u ;0];
%% analyticke reseni
u_analytic =@(x) (sin(x)-sin(L)*x/L);
%% vykresleni
figure (1);
plot (x,u,'r-*');
hold on;
ezplot ( u_analytic ,[0 ,L]);
hold off
figure (2);
plot(x,abs (u- u_analytic (x)),'.-');
xlabel ('x');
fprintf ('Chyba reseni %3.2 e\n',norm (u- u_analytic (x)));