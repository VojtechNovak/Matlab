% -(k(x)*u'(x))' = 30 + 2*Dirac(1), x z (0,1)
% u(0) = 1
% % k(1)*u'(1) = 3

% MKP diskretizace
L = 100;
n = 50;
nn = 2*n+1;
he = L/n;
x = 0:he/2:L;
nvlnka = length(x);
F = sin(x);
k = 1;
U = 1;
% data ulohy
K = k*ones(1,nvlnka-1);
%F = f*ones(1,nvlnka-1);
uDirich = [1]; idxDirich = [1];
idxNonDirich = setdiff(1:nvlnka,idxDirich);
tauNeum = 1; idxNeum = nvlnka;
T = 1;

% MKP
%[A,b] = mkp1d(x,k,f,idxNeum,tauNeum,idxDirich,uDirich);

%% MKP1d
nvlnka = length(x);
Avlnka = zeros(nvlnka,nvlnka);
cvlnka = zeros(nvlnka,1);

for e=1:n
    j = (e-1)*2+1;
    idxe = [j,j+1,j+2];
    xe = x(idxe);
    Ae = alok1d_quad(xe,K(e));
    Avlnka(idxe,idxe) = Avlnka(idxe,idxe) + Ae;
    ce = clok1d_quad(xe,F(e));
    cvlnka(idxe) = cvlnka(idxe) + ce;
end

% Neumannovy podminky
cvlnka(idxNeum) = cvlnka(idxNeum) + tauNeum;

% Dirichletovy podminky
idxNonDirich = setdiff(1:nvlnka,idxDirich);
A = Avlnka(idxNonDirich,idxNonDirich);
b = cvlnka(idxNonDirich);
Ahat = Avlnka(idxNonDirich,idxDirich);
b = b - Ahat*uDirich;


%% plot?
uvlnka = zeros(nvlnka,1);
u = A\b;
uvlnka(idxNonDirich) = u;
uvlnka(idxDirich) = uDirich;
hold on

plot(x,uvlnka,'--rs','LineWidth',2)
legend('FEM linearni prvky','analyticke reseni','FEM kvadraticke prvky');
%% analytical solution
u=@(x) sin(x) + (T-cos(L))*x + U     % points of visualization
x = 0:he/2:L;
g = u(x);
hold on; plot(x,g)       % plot of the analytical solution
legend('FEM','analytical');
grid on
