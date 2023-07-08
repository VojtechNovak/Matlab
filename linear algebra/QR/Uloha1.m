function [ v, Q ] = Uloha1( v,x )
%QR_GIV QR pomoci Givensovy transformace
%   Detailed explanation goes here

[n,m]=size(v);              %n radku vektoru
Q=eye(n);

for i=n:-1:x            %radky
    c=v(i-1,1)/sqrt(v(i-1,1)^2+v(i,1)^2);       %kosinus
    s=-v(i,1)/sqrt(v(i-1,1)^2+v(i,1)^2);       %sinus
        G=eye(n);
        G(i-1,i-1)=c;
        G(i-1,i)=s;
        G(i,i-1)=-s;
        G(i,i)=c;
        
    v=G'*v;
    Q=Q*G;
end
 

end

