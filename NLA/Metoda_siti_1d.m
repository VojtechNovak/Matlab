%% 1d model problem
%   -u''(x)=f(x) in (0,L)
%   u(0)=u(L)=0
%   solved using finite differences

% inputs:
L=10; % domain length
n=20; % number of discretization intervals
f=@(x)2*x;

% solution:
h=L/n;
A=2*diag(ones(1,n-1))-diag(ones(1,n-2),1)-diag(ones(1,n-2),-1);
x=linspace(0,L,n+1)';
b=h*h*f(x(2:end-1));
u=zeros(n+1,1);
u(2:end-1)=A\b;

figure; plot(x,u); 
hold on
plot(x,u,'.');
grid on
xlabel("x"); legend("u(x)")