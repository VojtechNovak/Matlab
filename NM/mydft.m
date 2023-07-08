clc;
clear all;
close all;

fk = [0.4 1.5 -0.2 -2 -1 0.1 -0.3 -0.5 0.7 2 0.6 -0.4];
L = length(fk);
x = 1:1:L;
N = 15;
Xk = dft_fun(fk,N);
k=(0:N-1)*10;
subplot(2,1,1)
stem(k,abs(Xk))
xlabel('k')
ylabel('|fk|')
title('Amplituda signalu A')

subplot(2,1,2)
stem(k,angle(Xk))
xlabel('k')
ylabel('uhel v radianech(fk)')
title('Uhel v komplexni rovine')

figure;
stem(x,fk)
xlabel('k')
ylabel('fk')
title('Originalni data')