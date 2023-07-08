%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algoritmus rychle Fourierovy transformace (prime) %
% zalozeny na jejim maticovem zapisu                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function X=myfft(x);

% Jestlize je x radkovy vektor, bude preveden na sloupcovy
[n1,n2]=size(x);
if n2>1; x=rot90(x,-1); OK=1; 
else OK=0;
end;

N=length(x); n=log2(N);

% Vytvoreni permutacniho vektoru
pt=(1:N)';
i_odd=(1:N/2)*2-1; % liche koeficienty
i_even=(1:N/2)*2; % sude
for i=1:n-1
   m=2^(i-1); K=N/(2*m);
   pt_odd=reshape(pt(i_odd),K,m)
   pt_even=reshape(pt(i_even),K,m)
   pt=reshape([pt_odd;pt_even],N,1)
end;

% Prenasobovani dilcimi maticemi
X=x(pt);
for i=1:n
   K=2^i; m=N/K; % m je pocet bloku B na diagonale, K je rad bloku B
   w=exp(2i*pi/K);
   D=diag(w.^(0:-1:-(K/2-1))); %diagonal. matice s prvky w
   I=eye(K/2); % Jednotkova matice
   B=[[I,D];[I,-D]]; % Blok B
   V=diags(B,m); % Matice sestavena z m bloku B
   X=V*X;
end;

if OK; X=rot90(X); end;