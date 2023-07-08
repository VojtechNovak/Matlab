fun = 6; x0 = [1 ; 1]; tol = 0.0000001;
% [xmin, it] = newton_global(fun, x0, tol)
%
% minimalizuje funkci f(x) Newtonovou metodou
% Newtonuv krok spocten pomoci GEM
% zajistuje globalni konvergenci a pozitivni defitnost Hessianu
%
% xmin ... minimum
% it ... pocet iteraci
%
% fun ... volba funkce f
% x0 ... pocatecni iterace
% tol ... presnost pro ukoncovaci podminku

addpath('supp_fun')

vykresli = 0;
[f, df, ddf] =  vyber_funkci(fun, vykresli);

x = x0;
fx = f(x);
g = df(x);

H = Hessian_SPD(ddf(x)); 
h = -H \ g;

lambda = wolfe(f, df, g, x, h);  
xn = x + lambda*h;
fxn = f(xn);

it = 1;
res(1) = norm([4;2] - xn);
% alternativne: (1) norm(g), (2) norm(xn - x) >= tol 
while norm(g) >= tol 
    x = xn;
    fx = fxn;
    g = df(x);

    H = Hessian_SPD(ddf(x)); 
    h = -H \ g;
    
    lambda = wolfe(f, df, g, x, h);  
    xn = x + lambda*h;
    fxn = f(xn);
    
    res(it) =  norm([4;2] - xn);
    
    it = it + 1;
end

xmin = x;


[grad_min, grad_it, grad_res] = gradient_halving(6,[1 ; 1], tol);

[Nd_min, Nd_it, Nd_res] = newton_diference(6,[1 ; 1], tol);

[trust_min, trust_it, trust_res] = trust_region(6,[1 ; 1],0.7 , tol);

[bfgs_min, bfgs_it, bfgs_res] = bfgs(6,[1 ; 1] , tol);
%% residual plot
figure
semilogy(1:length(res),res);
title('Velikost residua v kazde iteraci')

hold on
plot(1:length(grad_res),grad_res);

hold on
plot(1:length(Nd_res),Nd_res);

hold on
plot(1:length(Nd_res),Nd_res);

hold on
plot(1:length(trust_res),trust_res);
legend({'Newtonova metoda','Gradientni metoda','trust region','Newtonova metoda diference'})
xlabel('iterace') 
ylabel('residua') 

hold on

plot(1:length(bfgs_res),bfgs_res);
title('Velikost residua v kazde iteraci')
legend('BFGS')
xlabel('iterace') 
ylabel('residua') 

%% funkce
function smin = gershgorin(H)
    % odhadne spodni hranici spektra symetricke matice H
    r = sum(abs(H),2) - diag(abs(H)); 
    smin = min(diag(H) - r);
end

function H = Hessian_SPD(H)
    % zajistime pozitivni definitnost Hessianu
    
    %smin = min(eig(H));
    smin = gershgorin(H);
        
    if abs(smin) <= 1e-10
        H = H + 0.1*eye(size(H));
    elseif smin < -1e-10
        H = H + (-smin + 0.1)*eye(size(H));
    end
    %eig(H)'   
end

function lambda = wolfe(f, df, g, x, h)
    % Wolfe: vylouceni prilis dlouhych a kratkych kroku
    
    % koeficienty pro Wolfeovy podminky:
    koef = 0.9;    alfa = 0.05;     beta = 0.95;
    
    lambda = 1;
    
    too_long = f(x+lambda*h) > f(x) + alfa*lambda*g'*h;
    too_short = df(x+lambda*h)'*h < beta*g'*h;    
    while  too_long || too_short   
      if too_long
         lambda = lambda * koef;
      else
         lambda = lambda / koef;
      end
      too_long = f(x+lambda*h) > f(x) + alfa*lambda*g'*h;
      too_short = df(x+lambda*h)'*h <= beta*g'*h; 
    end   
end

