n = 10;
nn = 2*n+1;
lgth = 10;
he = lgth/n;
x = [0:he/2:lgth];
AC = 1
F = zeros(nn,1);
F(1) =1;   F (nn)=sin(lgth);
L = lgth;
c = 1.0;
count = 0;
tic
T = 0;
U = 1;

while(c>0)
    [F1]  = assembly(F,n,he);
    c = 0.0;
    for i = 1:nn
        if(abs(F(i)-F1(i))>AC)
            c = c+1;
            break;
        end
    end
    F = F1;
end
disp('Hence solution=:');
[F1] = assembly(F,n,he);
F = F1;

diff = abs(F-sin(x)');

fprintf('No of elements = %d\n',n)
disp('     x              FEM                Exact                Error')
disp([x',F, sin(x)',diff])

plot(x,F,'--bs','LineWidth',2)
xlabel('x')
ylabel('u(x)')
title('Graf reseni dane okrajove ulohy')

% analytical solution

u=@(x) sin(x) + (cos(L))*x + U ; ;       % points of visualization
g = u(x);
hold on; plot(x,g)       % plot of the analytical solution
legend('FEM kvadraticke prvky','analytical');
grid on

toc

function [F1] = assembly(F,n,he)
nn = 2*n+1;
K = zeros(nn,nn);
R = zeros(nn,1);
syms x
S = [1-x/he,x/he];
dS=diff(S,x);
lmm=[];
 for i = 1:n
     j = (i-1)*2+1;
     lmm =[lmm;[j,j+1,j+2]];
 end
 
 for i=1:n
     lm = lmm(i,:);
     
     %element matrix (k11) a RHS matrix (f1)
     
     %k11=-int(dS'*dS,x,0,he)+int(S'*dS*S(1),x,0,he)*F(lm(1))+int(S'*dS*S(2),x,0,he)*F(lm(2)))-int(S'*S,x,0,he);
     %f1 = int(sin(2*(x+(i-1)*he))*S',x,0,he);
     [k111,k113,k221,k222,k223,f11] = gaussquadr(he,i); 
     k11=-k111+(k221*F(lm(1))+k222*F(lm(2))+k223*F(lm(3)))-k113;
     f1=f11;
     K(lm,lm)=K(lm,lm)+k11;
     R(lm) = R(lm)+ f1;
 end
%K(1,:)=0.0;   
K(nn,:)=0.0;
%K(1,1) = 1.0; 
K(nn,nn)=1.0;
K(1,1) = K(1,1);
R(1,1)=R(1,1)+0;

d = K\R;
F1 = d;
end
 
     
function [k111,k113,k221,k222,k223,f11] = gaussquadr(he,i); 
gL = [-sqrt(3/5);0;sqrt(3/5)];
gW = [5/9,8/9,5/9 ];

k111=zeros(3);k113=zeros(3);k221=zeros(3);k222=zeros(3);k223=zeros(3);f11=sparse(3,1);

for k=1:length(gW)
    s=gL(k); w = gW(k);
    n = [-(1-s)*s/2,(1-s^2),(1+s)*s/2];
    dns=[(2*s-1)/2, -2*s, (2*s+1)/2];
    coord=[(i-1)*he;(i-1/2)*he;i*he];
    x = n*coord(:,1);
    
    J=he/2;
    dx=(1/J)*dns;
    
    k113 = k113+J*w*n'*n;
    k111= k111+J*w*dx'*dx;
    
    k221=k221+J*w*n'*dx*n(1);
    k222=k222+J*w*n'*dx*n(2);
    k223=k223+J*w*n'*dx*n(3);
    f11=f11+J*w*n'*sin(x);
end
end



