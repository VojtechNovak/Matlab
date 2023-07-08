A = [1,2,1;3,0,0];
B = [-1,1,0;2,3,1];
x = transp(A);
y = transp(B);

%% a,
s = A+B;
f = transp(A+B);
g = transp(A)+transp(B);
i = A+1;


%% b,
C = [1,-1;2,0];
D = [1,1;-2,8];
j = transp(C);
k = transp(D);

p = C*D;
n = transp(p);
m = j*k;

%%

X = [1, -1, 4, ; 2, 4, -16;1,-5,-8];
ASD = [1, -2, 5, ;7 , 9, -5;-2,3,9];
j1 = transp(X);
k1 = transp(ASD);
 p1 = X*ASD;
 n1 = transp(p1);
 m1 = j1*k1;