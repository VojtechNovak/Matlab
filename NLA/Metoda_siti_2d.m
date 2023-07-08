%% 2d model problem
%   -div(k*grad(x))=f(x) in (0,L)x(0,L)
%   u(0)=u(L)=0
%   solved using finite differences

% inputs:
L=10;
n=100; % number of discretization intervals (in both directions)
f=@(x1,x2)-3*x1-sin(x2);

% solution:
h=L/n;
A_1d=2*diag(ones(1,n-1))-diag(ones(1,n-2),1)-diag(ones(1,n-2),-1);
A=(kron(eye(n-1),A_1d)+kron(A_1d,eye(n-1)));
x=linspace(0,L,n+1);
[X1,X2]=meshgrid(x,x);
X1_inside = X1(2:end-1,2:end-1); X1_inside=X1_inside(:);
X2_inside = X2(2:end-1,2:end-1); X2_inside=X2_inside(:);
b=h*h*f(X1_inside,X2_inside);
u=zeros(n+1);
u_inside=A\b;
u(2:end-1,2:end-1)=reshape(u_inside,n-1,n-1);

surf(X1,X2,u)
xlabel("x1"); ylabel("x2"); 

%% reset po 200 iteracich

[reseni,flag,relres,iter,resvec] = gmres(A,b,200,1e-5);

delkax = length(resvec);
xosa = 1:delkax;

%% reset po 100 iteracich

[reseni1,flag,relres,iter,resvec1] = gmres(A,b,100,1e-5);
%%
delkax1 = length(resvec1);
xosa1 = 1:delkax1;

%% reset po 20 iteracich

[reseni2,flag,relres,iter,resvec2] = gmres(A,b,20,1e-5);

%% vykresleni grafu
delkax2 = length(resvec2);
xosa2 = 1:delkax2;

semilogy(xosa,resvec);

hold on

semilogy(xosa1,resvec1);

semilogy(xosa2,resvec2);
title('Prubeh konvergence')
xlabel('Iterace') 
ylabel('norma rezidua') 
legend({'restart po 200 iteracích','restart po 100 iteracích','restart po 20 iteracích'},'Location','northeast')