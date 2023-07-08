function [c]=myidwt(ca, cd)
a=[ca cd];
M=length(a);
h(1)=-3-1i*sqrt(15); h(2)=5-1i*sqrt(15); h(3)=30+1i*2*sqrt(15);
h(4)=h(3); h(5)=h(2); h(6)=h(1);
h=h/64;
g(1)=conj(h(6)); g(2)=-conj(h(5)); g(3)=conj(h(4)); g(4)=-conj(h(3));
g(5)=conj(h(2)); g(6)=-conj(h(1));
for i=1:M/2
H(i,(i-1)*2+1:(i-1)*2+length(h))=h;
G(i,(i-1)*2+1:(i-1)*2+length(h))=g;
end
H=H(1:M/2,1:M);
G=G(1:M/2,1:M);
Mat=2*[H
G];
c=(Mat'*a')';