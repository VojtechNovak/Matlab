function [R,P]=rad(n)
P=[];
N=2^n;
for i=0:N-1
p=dec2bin(i,n);
P(:,i+1)=bin2dec(p');
end
P=[zeros(1,N);P];
R=(-1).^P;
