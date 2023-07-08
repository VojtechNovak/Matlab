n=8; N=2^n;
t=(0:N-1)'; % Diskretni promenna (sloupcovy vektor)
w1=2*pi/N*8; w2=2*pi/N*40; w3=2*pi/N*80;
f=sin(w1*t)+sin(w2*t)+sin(w3*t); % Diskretni funkce
M =3;

N=length(f); C=f';
for i=1:M
for j=1:2^(i-1)
n=N/2^(i-1); %delka paketu na i-te hladine
% Vypocet komprim.,dopln. koef. pomoci komplex. waveletu
[ca, cd]=mydwtR(C(i,(j-1)*n+1:j*n));
C(i+1,(j-1)*n+1:j*n)=[ca(1:n/2), cd(1:n/2)];
end
end
% Vyhlazeni
R=C;
for i=1:N
if(abs(C(M+1,i))<=median(f)) R(M+1,i)=0; nvyhl=nvyhl+1; end
end
% Rekonstrukce vyhl.signalu
for i=M+1:-1:2
for j=1:2:2^(i-1)
m=floor(N/2^(i-1));
fx=myidwtR(R(i,(j-1)*n+1:j*n),R(i,j*n+1:(j+1)*n));
R(i-1,(j-1)*n+1:(j-1)*n+length(fx))=fx;
end
end
R=real(R); plot(C(1,:)); hold on; plot(R(1,:),'r');