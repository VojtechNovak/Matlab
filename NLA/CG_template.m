function [ u, relres ] = CG( A,b,u,tol,maxit )
% Metoda sdruzenych gradientu (Conjugate gradient method),
% pouziva pouze dva skalarni souciny a
% ukoncovaci podminku na relativni normu rezidua.
if nargin<2
    b=ones(length(A),1);
end
if nargin<3
    u=zeros(length(b),1);
end
if nargin<4
    tol=1e-6;
end
if nargin<5
    maxit=100;
end





end