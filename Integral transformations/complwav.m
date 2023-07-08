% Komplexni wavelety,           David Horak                     10.7.2000

function [b]=complwav(a,n)

% Mallatuv algoritmus pro komplexni wavelet - komprese.
% Vstup  : a ... filtrovany vektor (mocnina dvou 2^m)
%          n ... pocet projekci    (pozaduje se  n<m-1)
% Vystup : b ... vektor projekci

M=length(a);

%h(1)=1+i; h(2)=1-i; h(3)=h(2); h(4)=h(1); 
%h=h/4;
%g(1)=conj(h(4)); g(2)=-conj(h(3)); g(3)=conj(h(2)); g(4)=-conj(h(1));

h(1)=-3-1i*sqrt(15); h(2)=5-1i*sqrt(15); h(3)=30+1i*2*sqrt(15); 
                    h(4)=h(3); h(5)=h(2); h(6)=h(1);
h=h/64;
g(1)=conj(h(6)); g(2)=-conj(h(5)); g(3)=conj(h(4)); g(4)=-conj(h(3));
                 g(5)=conj(h(2)); g(6)=-conj(h(1));

a=a;
for i=1:n
  %  a=[a,a(1:4)];
  a=[a,a(1:6)];
  for k=1:M/2                 % filtrace
    %b(k)=h(1)*a(2*k-1)+h(2)*a(2*k)+h(3)*a(2*k+1)+h(4)*a(2*k+2);
    %b(k+M/2)=g(1)*a(2*k-1)+g(2)*a(2*k)+g(3)*a(2*k+1)+g(4)*a(2*k+2);
    b(k)=h(1)*a(2*k-1)+h(2)*a(2*k)+h(3)*a(2*k+1)+h(4)*a(2*k+2)+h(5)*a(2*k+3)+h(6)*a(2*k+4);
    b(k+M/2)=g(1)*a(2*k-1)+g(2)*a(2*k)+g(3)*a(2*k+1)+g(4)*a(2*k+2)+g(5)*a(2*k+3)+g(6)*a(2*k+4);
  end

  M=M/2;
  clear a
  a=b(1:M);
  
  % Entropie zpracovaneho signalu (ne paketu na dane hladine)
  %Eshann(i)=wentropy(abs(b),'shannon');

end

%Eshannon=Eshann(length(Eshann));