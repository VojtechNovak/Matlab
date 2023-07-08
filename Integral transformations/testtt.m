n=8; N=2^n;
%t=(fix(-N/2):fix(N/2-1));
t=(0:N-1)'; % Diskretni promenna (sloupcovy vektor)
w1=2*pi/N*8; w2=2*pi/N*40; w3=2*pi/N*80;
f=sin(w1*t);
f(fix(N/4):fix(3*N/4))=f(fix(N/4):fix(3*N/4))+0.3*sin(w3*t(fix(N/4):fix(3*N/4)));
f(fix(N/2):N-1)=f(fix(N/2):N-1)+0.3*sin(w2*t(fix(N/2):N-1));
f(1:62)= f(1:62) + (-1/2 + (1/2+1/2)*rand(62,1))
N =3;

figure
plot(t,f)
%%
M=length(f);
C=f';
%%
for i=1:N
for j=1:2^(i-1)
%delka paketu na i-te hladine
m=M/2^(i-1);
% Vypocet komprim. a dopln. koef. bud pomoci komplex. nebo jine base
[ca, cd]=mydwt(C(i,(j-1)*m+1:j*m));
C(i+1,(j-1)*m+1:j*m)=[ca(1:m/2), cd(1:m/2)];
end
end
% Vyhlazeni
R=C;
nvyhl = 0;
for i=1:M
if(abs(C(N+1,i)))<=4*median(abs(C(N+1,:)))
R(N+1,i)=0;
nvyhl=nvyhl+1;
end
end
nvyhl
% Rekonstrukce vyhl.signalu
for i=N+1:-1:2
for j=1:2:2^(i-1)
m=floor(M/2^(i-1));
fx=myidwt(R(i,(j-1)*m+1:j*m),R(i,j*m+1:(j+1)*m));
R(i-1,(j-1)*m+1:(j-1)*m+length(fx))=fx;
end
end
R=real(R);
dif=C(1,:)-R(1,:);
figure
plot(C(1,:))
hold on
plot(R(1,:),'r','LineWidth',1.5)
figure
plot(dif)
%%
% figure
% hold on
% plot(R(1,:),'k')
% plot(R(2,:),'r')
% plot(R(3,:),'b')
% plot(R(4,:),'y')
