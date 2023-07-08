A = [1 3 2 1; 2 2 3 1;1 3 1 2; 1 3 3 2]
b = [2 2 1 1];
n = length(b);
I = eye(n);
L = eye(n);

for k=1:n-1
    pivot = A(k,k);
    for j = k+1:n
        l = -A(j,k)/pivot;
        A(j,:) = l*A(k,:) + A(j,:);
        I(j,:) = l*I(k,:) + I(j,:);
    end
end

for k=1:n-1
    pivot = I(k,k);
    for j = k+1:n
        l = -I(j,k)/pivot;
        I(j,:) = l*I(k,:) + I(j,:);
        L(j,:) = l*L(k,:) + L(j,:);
    end
end

U = A;

Z = fsubst(L,b);
X = bsubst(U,Z);

disp(Z);
disp(X);

