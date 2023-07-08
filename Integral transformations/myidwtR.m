function [a]=myidwtR(ca, cd)
c=[ca cd]; N=length(c);
h(1)=1; h(2)=1; h=h/sqrt(2);
g(1)=1; g(2)=-1; g=g/sqrt(2);
for i=1:N/2
H(i,(i-1)*2+1:(i-1)*2+length(h))=h;
G(i,(i-1)*2+1:(i-1)*2+length(h))=g;
end
M=[H 
   G];
a=(M'*c')';
