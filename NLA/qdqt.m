function[ Q, d, it] = qdqt( A )
%QDQT Pocita spektralni rozklad pomoci QR algoritmu
%   Vraci ortogonalni matici Q (sloupce jsou ortonormalni vlastni vektory
%   A), vektor d obsahujici vlastni cisla matice A a pocet iteraci nutnych
%   k dosazeni reseni.

D = A;
[m,~] = size(A);
Q = eye( m );
tol = 1e-3;

it = 1;

% iterace ukoncime, pokud norma mimodiagonalnich prvku bude dostatene mala
while( norm(D - diag(diag(D))) > tol)
    [Qk, Rk] = qr(D);
    D= Rk*Qk;
    Q = Q*Qk;

    it = it + 1;
end

d = diag(D);

end

