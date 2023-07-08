function [F]=four(n)

N=2^n;
w=exp(2i*pi/N);

for i=1:N
  for j=1:N
    F(i,j)=w^((i-1)*(j-1));
  end
end
