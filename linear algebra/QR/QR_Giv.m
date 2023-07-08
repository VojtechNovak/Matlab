function [ Q,R ] = QR_Giv( A )
%QR_GIV QR pomoci Givensovy transformace
%   Detailed explanation goes here

[m,n]=size(A);
Q=eye(m);
R=A;

for j=1:n                     %sloupce
    for i=m:-1:j+1              %radky
        c=A(i-1,j)/sqrt(A(i-1,j)^2+A(i,j)^2);       %kosinus
        s=-A(i,j)/sqrt(A(i-1,j)^2+A(i,j)^2);       %sinus
            G=eye(m);
            G(i-1,i-1)=c;
            G(i-1,i)=s;
            G(i,i-1)=-s;
            G(i,i)=c;
        A=G'*A;
        Q=Q*G;
    end
    
end
R=A;

end

