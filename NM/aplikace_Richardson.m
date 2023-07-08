%% vstupni data (SPD matice, vektor prave strany)
n=10;
c0=9; c1=-1; c2=2;
A=c0*eye(n)+c1*diag(ones(n-1,1),1)+c1*diag(ones(n-1,1),-1)+c2*diag(ones(n-2,1),2)+c2*diag(ones(n-2,1),-2);
b=ones(n,1);

%% volba zakladnich parametru
maxit=1000; epsilon=1e-6; u0=zeros(n,1);

%% volba parametru omega a aplikace Richardsonovy metody
omega=0.01;
[u,res]=richardson(A,b,omega,maxit,epsilon,u0);
iter=length(res);
disp(["Richardson: omega=", num2str(omega), "iter=", num2str(iter)])