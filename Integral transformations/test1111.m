n = 8

%%
P=[];
N=2^n;
for i=0:N-1
  p=dec2bin(i,n);
  P(:,i+1)=bin2dec(p');
end
P=[zeros(1,N);P];
R=(-1).^P;

%%
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

%% 
[W,P] = M;
