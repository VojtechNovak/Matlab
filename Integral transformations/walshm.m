function [Wm]=walshm(n)

N=2^n;
[W,P]=walsh(n);
for i=1:size(W,2)-1
  S(:,i)=W(:,i)+W(:,i+1);
end

for i=1:N
  Z(i)=N-nnz(S(i,:));
end

for i=1:N
  Wm(i,:)=W(Z==i,:);
end
