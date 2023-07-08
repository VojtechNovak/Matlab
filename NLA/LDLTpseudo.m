A = [1,3,4;3,1,3;4,3,-1];
n = length(A);
L = eye(n, n); 
D = zeros(n, n);
v(1) = A(1, 1);
D(1, 1) = v(1);
L(2 : n, 1) = A(2 : n, 1)/v(1);

for j = 2 ; n
    for i = 1 ; j-1
        v(i) = L(j,i).*D(i,i);
    end
    v(j) = A(j,j) - L(j,1:j-1).*v(1:j-1);
    D(j,j) = v(j);
    L(j+1:n,j) = (A(j+1:n,j)-L(j+1:n,1:j-1).*v(1:j-1))/v(j);
end


