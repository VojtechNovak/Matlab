V = 1:6;

M = gen_SPD(50);

M1 = M(2:end,2:end);
M2 = M(2:2:4,:);
I = eye(5);
e = eigs(M);

lambda1 = e(1);
lambdaN = e(end);

MAXE = max(eigs(M));
MINE = min(eigs(M));
S = svd(M);
L_min = eigs(M,1,'smallestabs');
lambda_max =  eigs(M,1,'LM');
lambda_min =  eigs(M,1,'SM');

if (lambda1 == lambda_max && lambdaN == lambda_min)
    fprintf('yes.\n\n');
end
if (MAXE == lambda_max && MINE == lambda_min)
    fprintf('ano.\n\n');
end