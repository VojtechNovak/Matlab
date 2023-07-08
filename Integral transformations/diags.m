function D=diags(B,m);

K=length(B);
N=m*K;
D=zeros(N);
for i=1:m;
   D(K*(i-1)+1:K*i,K*(i-1)+1:K*i)=B;
end;