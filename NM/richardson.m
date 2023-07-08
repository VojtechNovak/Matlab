function [ u, res ] = richardson( A,b,omega,maxit,epsilon,u )
%RICHARDSON iteracni reseni soustav linearnich rovnic
%   A ... matice soustavy
%   b ... vektor prave strany
%   omega ... parametr Richardsonovy metody
%   maxit ... maximalni pocet iteraci
%   epsilon ... pripustna chyba Eukl. normy rezidua
%   u ... pocatecni iterace
if nargin<3
    omega=1;
end
if nargin<4
    maxit=100;
end
if nargin<5
    epsilon=1e-6;
end
if nargin<6
    u=zeros(length(b),1);
end
res=zeros(maxit,1);
for i=1:maxit
    r=b-A*u;
    norm_r=norm(r);
    res(i) = norm_r;
    if norm_r<epsilon
        res = res(1:i);
        break
    end
    u=u+omega*r;
end

end

