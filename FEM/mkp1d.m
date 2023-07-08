function [A,b] = mkp1d(x,k,f,idxNeum,tauNeum,idxDirich,uDirich)

nvlnka = length(x);
Avlnka = zeros(nvlnka,nvlnka);
cvlnka = zeros(nvlnka,1);

for e=1:nvlnka-1
    idxe = [e,e+1];
    xe = x(idxe);
    Ae = alok1d(xe,k(e));
    Avlnka(idxe,idxe) = Avlnka(idxe,idxe) + Ae;
    ce = clok1d(xe,f(e));
    cvlnka(idxe) = cvlnka(idxe) + ce;
end

% Neumannovy podminky
cvlnka(idxNeum) = cvlnka(idxNeum) + tauNeum;

% Dirichletovy podminky
idxNonDirich = setdiff(1:nvlnka,idxDirich);
A = Avlnka(idxNonDirich,idxNonDirich);
b = cvlnka(idxNonDirich);
b = b - Avlnka(idxNonDirich,idxDirich)*uDirich;