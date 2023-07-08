% -(k(x)*u'(x))' = 30 + 2*Dirac(1), x z (0,1)
% u(0) = u(1) = 1
% % k(1)*u'(1) = 3

% MKP diskretizace
L = 100;
h = 1;
x = 0:h:L;
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

for e=1:nvlnka-1
    idxe = [e,e+1];
    xe = x(idxe);
    Ae = alok1d(xe,K(e));
    Avlnka(idxe,idxe) = Avlnka(idxe,idxe) + Ae;
    ce = clok1d(xe,F(e));
    cvlnka(idxe) = cvlnka(idxe) + ce;
end

% Neumannovy podminky
cvlnka(idxNeum) = cvlnka(idxNeum) + tauNeum;

% Dirichletovy podminky
idxNonDirich = setdiff(1:nvlnka,idxDirich);
A = Avlnka(idxNonDirich,idxNonDirich);
b = cvlnka(idxNonDirich);
b = b - Avlnka(idxNonDirich,idxDirich)*uDirich;


%% plot?
uvlnka = zeros(nvlnka,1);
u = A\b;
uvlnka(idxNonDirich) = u;
uvlnka(idxDirich) = uDirich;

figure; 
plot(x,uvlnka,'--rs','LineWidth',2); hold on

%% analytical solution
u=@(x) sin(x) + (T-cos(L))*x + U ;       % points of visualization
x=linspace(0,L,100);
g = u(x);
hold on; plot(x,g)       % plot of the analytical solution
legend('MKP kvadraticke prvky','analyticke reseni');
grid on