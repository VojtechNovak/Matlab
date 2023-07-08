function [ x ] = LDMT (A)
n = size(A);
L = eye(n,n);
M = eye(n,n);
D = zeros(n,n);
for j = 1:n
    for i = 1:j-1
        v(i)=L(j,i)*D(i);
    end
    v(j)=A(j,j)-L(j,l:j-1)*v(1:j-1);
    D(j)=v(j);
    L(j+1:n,j)= (A(j+1:n,j)-L(j+1:n,l:j-1)*v(1:j-1))/v(j);
end
    
    

    end