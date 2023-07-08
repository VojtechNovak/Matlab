function [theta, dtheta, sol] = vyber_ulohu(uloha, rho)

switch uloha
    case 1
        
        f = @(x) x(1) + x(2);
        a = @(x) max(0, x(1)^2 + x(2)^2 - 2);
        
        gf = [1; 1];
        gg = @(x) [2*x(1); 2*x(2)];
        
        theta = @(x) f(x) + 1/2*rho*(a(x))^2;
        dtheta = @(x) gf + rho*gg(x)*a(x);
 
        sol = [-1;-1];
        
    case 2
        
        f = @(x) x(1)^2 + x(2)^2;
        a = @(x)  max(0, x(2) + 5);
        
        gf = @(x) [2*x(1); 2*x(2)];
        gg = [0; 1];
        
        theta = @(x) f(x) + 1/2*rho*(a(x))^2;
        dtheta = @(x) gf(x) + rho*gg*a(x);   
        
        sol = [0;-5];
        
    case 3
        
        f = @(x) x(1)^2 + x(2)^2;
        a = @(x)  max(0, -x(2) - 5);
        
        gf = @(x) [2*x(1); 2*x(2)];
        gg = [0; -1];
        
        theta = @(x) f(x) + 1/2*rho*(a(x))^2;
        dtheta = @(x) gf(x) + rho*gg*a(x);   
        
        sol = [0;0];        
               
    case 4
        
        f = @(x) x(1)^2 + x(2)^2;
        a = @(x) max( 0, [-x(1) - x(2) + 1; x(1) - x(2) - 1] );
       
        gf = @(x) [2*x(1); 2*x(2)];
        gg = [-1 1; -1 -1];
        
        theta = @(x) f(x) + 1/2*rho*a(x)'*a(x);
        dtheta = @(x) gf(x) + rho*gg*a(x);       
        
        sol = [1/2;1/2];
        
        case 5
        
        f = @(x) x(1) + 2*x(2);
        a = @(x) max( 0, x(1)^2 - 2*x(1) + x(2)^2 );
        h = @(x) (x(1) -1)^2 + x(2)^2 - 1;
        
        gf = @(x) [2*x(1); 2*x(2)];
        gg = @(x) [2*x(1)-2; 2*x(2)];
        gh = @(x) [2*(x(1)-1) ; 2*x(2)];
        
        theta = @(x) f(x) + 1/2*rho*a(x)'*a(x) *(h(x)'*h(x));
        dtheta = @(x) gf(x) + rho*gg(x)'*a(x) *(gh(x)'*h(x));       
        
        sol = [2;0];

    otherwise
        fprintf('Neznama uloha.\n')
        
end

