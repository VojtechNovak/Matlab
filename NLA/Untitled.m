x = [-2;-2;1];
n = norm(x);
V = [5; 2; 1];
VVT = V*V'
VTV = V'*V
I = eye(3);
P = I-2*(VVT/VTV)

X = [7;-2;-2;-1]


b = rand(1,3)
A = rand(5)
A(:,end) = zeros(size(A(:,end))) 
z = zeros(size(A(:,end)))