%% vstupni data (SPD matice, vektor prave strany)
A = [9 -1 2 0 0 0 0 0 0 0;
    -1 9 -1 2 0 0 0 0 0 0;
    2 -1 9 -1 2 0 0 0 0 0;
    0 2 -1 9 -1 2 0 0 0 0;
    0 0 2 -1 9 -1 2 0 0 0;
    0 0 0 2 -1 9 -1 2 0 0;
    0 0 0 0 2 -1 9 -1 2 0;
    0 0 0 0 0 2 -1 9 -1 2;
    0 0 0 0 0 0 2 -1 9 -1;
    0 0 0 0 0 0 0 2 -1 9];
b=rand(10,1);

%% volba zakladnich parametru
maxit=100; epsilon=1e-6; u0=zeros(10,1);
%% volba parametru omega 
[bounds] = Gersgorin_meze(A);
omega = 2/(bounds(1)+bounds(2));
%% aplikace Richardsonovy metody
[u,res]=richardson(A,b,omega,maxit,epsilon,u0);
iter=length(res);
disp(["Richardson: omega=", num2str(omega), "iter=", num2str(iter)])
%% graf rezidui
L = length(res)
figure(1)
plot(1:L,res)
grid
%% presne vlastni cisla
eigv = eig(A);
omega_opt = 2/(eigv(1)+eigv(10));
[u1,res1]=richardson(A,b,omega_opt,maxit,epsilon,u0);
%% graf rezidui
L1 = length(res1)
figure(2)
plot(1:L1,res1)
grid
%% odhad q 
c = bounds(2)/bounds(1);
q = (c-1) / (c+1);
r0 = res(1);
odhad = zeros (16,1);
for i = 1:16
    odhad(i) = q^i * r0;
end
figure(3)
plot(1:16,odhad)
