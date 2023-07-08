function omezmin(uloha)
% funkce resi ulohy s omezenim pomoci matlabovske funkce fmincon()

% syntaxe: x = fmincon(@myfun, x0, Aineq, bineq, Aeq, beq, lb, ub, @mycon)
% 
% @myfun ... objective function
% x0 ... initial point for x
% Aineq ... matrix for linear inequality constraints
% bineq ... vector for linear inequality constraints
% Aeq ... matrix for linear equality constraints
% beq ... vector for linear equality constraints
% lb ... vector of lower bounds
% ub ... vector of upper bounds
% @mycon ... nonlinear constraint function
%
% with 
% function [cineq, ceq] = mycon(x)
%      cineq = ... % nonlinear ineqs at x; if there aren't any: []
%      ceq = ...   % nonlinear eqs at x, e.g., @(x) x(1)^2 + x(2)^2 - 2

function [cineq, ceq] = mycon1(x)
    cineq = % K DOPLNENI...
    ceq = % K DOPLNENI...
end

switch uloha
    
    case 1
        
        % min x(1) + x(2) s NELINEARNIM omezenim  x(1)^2 + x(2)^2 <= 2
        xmin = fmincon(@(x) x(1) + x(2), [-10;-10], [], [], [], [], [], [], @(x)mycon1(x));
        
        sol = [-1;-1];
        
    case 2

        % min x(1)^2 + x(2)^2 s LINEARNIM omezenim  x(2) + 5 <= 0
        xmin = fmincon(@(x) x(1)^2 + x(2)^2, [0;0], [0,1], -5);
        
        sol = [0;-5];
        
    case 3
        
        %  min x(1)^2 + x(2)^2 s LINEARNIMI omezenimi  x(2) + 5 >= 0
        xmin = fmincon(@(x) x(1)^2 + x(2)^2, [0;0], [0,-1], 5);
        
        sol = [0;0];

    case 4
        
        % min x(1)^2 + x(2)^2 s LINEARNIMI omezenimi x(1) + x(2) >= 1, x(1) - x(2) <= 1
        xmin = fmincon( ); % K DOPLNENI...
        
        sol = [1/2;1/2];

end

fprintf("\n")
fprintf("nalezene reseni: [ %f, %f ]\n", xmin)
ns = norm(sol);
if ns > 1e-13
    fprintf("relativni chyba reseni: %1.3e\n", norm(xmin - sol)/ns)
else
    fprintf("absolutni chyba reseni: %1.3e\n", norm(xmin - sol))
end

end