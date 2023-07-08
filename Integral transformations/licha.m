clear all, close all, clc
L = 3*pi;

dx=0.01
% Define domain
x = (-3*pi:0.01:3*pi)';
% Start with all zeros: 
unitstep = sin(x); 
% But make everything corresponding to t>=1 one:
unitstep(x>=pi) = 2; 
unitstep(x<=-pi) = -2;
plot(x,unitstep,'b','linewidth',3) 

f = unitstep;

T = 3*pi;
w0 = pi/T;

%% Compute Fourier series
CC = jet(30);
A0 = 0;
fFS = A0/2;
for k=1:30
%A(k) =(1/T)* sum(f.*cos(w0*k*x))*dx; % Inner product
B(k) =(1/T)* sum(f.*sin(w0*k*x))*dx;
fFS = fFS + B(k)*sin(w0*k*x);
hold on;
plot(x,fFS,'-','Color',CC(k,:),'LineWidth',1.2)
title('Aproximace funkce pro n = 1,2,...')
xlabel('x') 
ylabel('y')
legend('funkce f')
pause(0.01)
end
%% posledni aprox
figure
plot(x,f,'-k','LineWidth',1.5), hold on
plot(x,fFS,'r','LineWidth',1.2)
xlabel('x')
ylabel('y')
legend('funkce f','Fourierova')
%% Plot amplitudes
figure
clear ERR
clear A
fFS = A0/2;
A(1) = A0/2;
ERR(1) = norm(f-fFS);
kmax = 100;
for k=1:kmax
    A(k+1) = sum(f.*cos(pi*k*x/L))*dx;
    B(k+1) = sum(f.*sin(pi*k*x/L))*dx;
%     plot(x,B(k)*sin(2*k*pi*x/L),'k-','LineWidth',1.2);
    fFS = fFS + A(k+1)*cos(k*pi*x/L) + B(k+1)*sin(k*pi*x/L);
    ERR(k+1) = norm(f-fFS)/norm(f);
end
thresh = median(ERR)*sqrt(kmax)*4/sqrt(3);
r = max(find(ERR>thresh));
r = 7;
subplot(2,1,1)
semilogy(0:1:kmax,A,'k','LineWidth',1.5)
hold on
semilogy(r,A(r+1),'bo','LineWidth',1.5)
xlim([0 kmax])
ylim([10^(-7) 1])
subplot(2,1,2)
semilogy(0:1:kmax,ERR,'k','LineWidth',1.5)
xlabel('k') 
ylabel('Chyba')
legend('Chyba aproximace')
hold on
