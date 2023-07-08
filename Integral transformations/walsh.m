function [W,P]=walsh(n)

N=2^n;
[R,P]=rad(n);
P=flipud(P);
P=[P(size(P,1),:)
  P(1:size(P,1)-1,:)];
 
W=ones(N,N);
for i=1:N
  for j=1:size(P,1)
    W(i,:)=W(i,:).*(R(j,:).^P(j,i));
  end
end
