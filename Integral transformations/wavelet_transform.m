%% Ukazkove signaly
n=8; N=2^n;
%t=(fix(-N/2):fix(N/2-1));
t=(0:N-1)'; % Diskretni promenna (sloupcovy vektor)
w1=2*pi/N*8; w2=2*pi/N*40; w3=2*pi/N*80;
f1=sin(w1*t)+sin(w2*t)+sin(w3*t); % Diskretni funkce
f2=sin(w1*t);
f2(fix(N/4):fix(3*N/4))=f2(fix(N/4):fix(3*N/4))+0.3*sin(w3*t(fix(N/4):fix(3*N/4)));
f2(fix(N/2):N-1)=f2(fix(N/2):N-1)+0.3*sin(w2*t(fix(N/2):N-1));

F = sin(t/20);

%f2(t<=30) = f2 + (-1/4 + (1/4+1/4)*rand(size(t)));

plot(t,f2 )

%%

wavdemo(f2,3)
