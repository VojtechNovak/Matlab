clear all, close all, clc
n = 1024;
w = exp(-i*2*pi/n);
% Slow
for i=1:n
for j=1:n
dft(i,j) = w^((i-1)*(j-1));
end
end
% Fast
[I,J] = meshgrid(1:n,1:n);
dft = w.^((I-1).*(J-1));
imagesc(real(dft))