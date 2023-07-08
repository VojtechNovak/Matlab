function [ Q ] = Ort( v )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[n,m]=size(v);
A(1:n,1)=v;
A(1:n,2:n)=rand(n,n-1);

[Q,R]=qr(A);
Q(:,1)=[];

end

