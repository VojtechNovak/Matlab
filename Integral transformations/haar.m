function [H]=haar(n)

N=2^n;
k=1/N;
H=zeros(N);
H(1,:)=1;
x=k/2:k:(1-k/2);

for m=0:n-1
  for k=1:2^m
    H(2^m+k,:)=sqrt(2^m)*(((2*k-2)/(2^(m+1))<x & x<(2*k-1)/(2^(m+1))) - ...
                          ((2*k-1)/(2^(m+1))<x & x<(2*k)/(2^(m+1))));
  end
end