function [ca, cd]=mydwtR(a)
M=length(a);
h(1)=1; h(2)=1; h=h/sqrt(2);
g(1)=1; g(2)=-1; g=g/sqrt(2);
for i=1:M/2
H(i,(i-1)*2+1:(i-1)*2+length(h))=h;
G(i,(i-1)*2+1:(i-1)*2+length(h))=g;
end
Mat=[H
     G];
b=(Mat*a')';
ca=b(1:M/2);
cd=b(M/2+1:M);