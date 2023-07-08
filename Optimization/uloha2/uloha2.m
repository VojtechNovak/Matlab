  uloha = 5; x0 = [0;0]; tol = 0.000001; rho = 1000;    
  
        f = @(x) x(1) + 2*x(2);
        a = @(x) max( 0, [x(1)^2 - 2*x(1) + x(2)^2;(x(1) -1)^2 + x(2)^2 - 1; -(x(1) - 1)^2 - x(2)^2 + 1] );
        
        gf = @(x) [1; 2];
        gg = @(x) [2*x(1)-2, 2*(x(1)-1) , -2*(x(1)-1); 2*x(2), 2*x(2), -2*x(2)];
        
        theta = @(x) f(x) + 1/2*rho*a(x)'*a(x);
        dtheta = @(x) gf(x) + rho*gg(x)*a(x);       
        
        sol = [2;0];


addpath('supp_fun')

if tol < 1e-1
    epsi = 1e-1;
else
    epsi = 100*tol;
end

% minimalizace metodou nejvetsiho spadu s globalni strategii
x = gradient_global(theta, dtheta, x0, epsi);

alfa = 10;
it_out = 1;

xosa = 0:0.01:2;
y = sqrt( -(xosa-2).*xosa );

plot(xosa,y)

hold on

plot(xosa, -y)

plot(xmin(1),xmin(2), '.', 'markersize', 20)

while epsi > tol
     
    rho = alfa * rho;
    epsi = epsi / alfa;
    
    % minimalizace metodou nejvetsiho spadu s globalni strategii
    x = gradient_global(theta, dtheta, x, epsi);
    
    it_out = it_out + 1;
    fprintf("nalezene reseni: [ %f, %f ]\n v it %f", xmin, it_out)
end

xmin = x;

fprintf("nalezene reseni: [ %f, %f ]\n", xmin)
ns = norm(sol);
if ns > 1e-13
    fprintf("relativni chyba reseni: %1.3e\n", norm(xmin - sol)/ns)
else
    fprintf("absolutni chyba reseni: %1.3e\n", norm(xmin - sol))
end
fprintf("pocet vnejsich iteraci: %d\n", it_out)
fprintf("posledni rho pouzite pro gradientni metodu: %1.2e\n", rho)

%%
xosa = 0:0.01:2;
y = sqrt( -(xosa-2).*xosa );

plot(xosa,y)

hold on

plot(xosa, -y)

plot(xmin(1),xmin(2), '.', 'markersize', 20)