clear all, close all, clc

% Define domain
L = pi;
dxx = 0.0013;
xx = (-1.3+dxx:dxx:1.3)*L;
g = exp(xx);

dx = 0.001;
x = (-1+dx:dx:1)*L;
n = length(x); nquart = floor(n/4);

% Define function
f = cos(x);

plot(x,f,'-k','LineWidth',1.5), hold on
%% Compute Fourier series
CC = jet(30);
A0 = sum(f.*ones(size(x)))*dx;
fFS = A0/2;
for k=1:30
A(k) = sum(f.*cos(pi*k*x/L))*dx; % Inner product
B(k) = sum(f.*sin(pi*k*x/L))*dx;
fFS = fFS + A(k)*cos(k*pi*x/L) + B(k)*sin(k*pi*x/L);
plot(x,fFS,'-','Color',CC(k,:),'LineWidth',1.2)
title('Aproximace funkce y = x')
xlabel('x') 
ylabel('y')
legend('funkce f')
pause(0.01)
end
%% posledni aprox
figure
plot(xx,g,'-k','LineWidth',1.5), hold on
plot(x,fFS,'r','LineWidth',1.2)
xlabel('x') 
ylabel('y')
legend('funkce f','aproximace v 30 kroce')
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
