function [ L, U, P ] = LUP( A )
%UNTITLED LU rozklad - s castecnou pivotizaci
%   Detailed explanation goes here

[n,m]=size(A);
L=eye(n);
U=zeros(n);
P=eye(n);

for k=1:n
    if k==1,
        v(k:n)=A(k:n,k);        %prvni sloupec
    else
        z = L(1:k-1,1:k-1)\A(1:k-1,k);      
        U(1:k-1,k)=z;
        v(k:n)=A(k:n,k)-L(k:n,1:k-1)*z;
    end
    if k<n,
        max=k;
        for t=k+1:n
            if v(t) > v(max),
                max=t;
            end
        end
        if k~=max,
            temp=P(k,:);
            P(k,:)=P(max,:);
            P(max,:)=temp;
            
            temp = v(k);
            v(k) = v(max);
            v(max) = temp;
            
            temp = A(k,:);
            A(k,:) = A(max,:);
            A(max,:) = temp;
        end      
        L(k+1:n,k)=v(k+1:n)/v(k);
        if k>1
            temp=L(k,1:k-1);
            L(k,1:k-1)=L(max,1:k-1);
            L(max,1:k-1)=temp;
        end
    end
    U(k,k)=v(k);
end
    
end

