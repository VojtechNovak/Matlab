function [x] = moje_gaussovka(A,b)

n = length(b);

for k=1:n-1
    pivot = A(k,k);
    for j = k+1:n
        l = -A(j,k)/pivot;
        A(j,:) = l*A(k,:) + A(j,:);
        b(j) = l*b(k) + b(j);
    end
end

x = zeros(n,1);
for j=n:-1:1
    subs = 0;
    if j < n
        subs = dot(A(j,j+1:n),x(j+1:n));
    end
    x(j) = (b(j) - subs)/A(j,j);
end

end

