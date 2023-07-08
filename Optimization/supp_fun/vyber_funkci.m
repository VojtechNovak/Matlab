function [f, df, ddf] = vyber_funkci(fun, vykresli)
% [f, df, ddf] = vyber_funkci(fun, vykresli)
%
% na zaklade volby fun vrati predpisy f, df a ddf a pripadne vykresli graf 

switch fun
    case 1
        f = @(x) x(1)^2 + x(2)^2; % rotacni paraboloid
        df = @(x) [2*x(1); 2*x(2)];
        ddf = @(x) [2  0; 0  2];
    case 2
        f = @(x) x(1)^4 + x(1)^2 + x(2)^2;
        df = @(x) [4*x(1)^3 + 2*x(1); 2*x(2)];
        ddf = @(x) [12*x(1)^2+2  0;  0  2];  
    case 3
        f = @(x) 100*x(1)^4 + x(2)^2;  % "vanova" funkce 
        df = @(x) [100*x(1)^3; 2*x(2)];
        ddf = @(x) [300*x(1)^2  0;  0  2];
    case 4
        f = @(x) sin(x(1))^2 + cos(x(2))^2; % plato vajicek
        df = @(x) [2*sin(x(1))*cos(x(1)); -2*sin(x(2))*cos(x(2))];  
        ddf = @(x) [2*cos(2*x(1))  0;   0 -2*cos(2*x(2))];
    case 5
        f = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2; % Rosenbrockova funkce
        % má tvar banánovitého údolí se strmými srázy v jednom směru a s plochým dnem ve směru druhém
        df = @(x) [-400*x(1)*(x(2) - x(1)^2) - 2*(1 - x(1)), 200*(x(2) - x(1)^2)]';
        ddf = @(x) [-400*(x(2) - x(1)^2) + 800*x(1)^2 + 2, -400*x(1); -400*x(1), 200];
    case 6
        f = @(x) 10*(x(1) - x(2)^2)^2 + (4 - x(1))^2;
        df = @(x) [20*(x(1)-x(2)^2)-2*(4-x(1)), -40*x(2)*(x(1)-x(2)^2)]';
        ddf = @(x) [ 22 , -40*x(2) ; -40*x(2) , -40*(x(1)-x(2)) + 80 * x(2)^2];
    otherwise
        fprintf('Neznama funkce.\n')
end

if vykresli
    nakresli(fun)
end

