function nakresli(fun)

switch fun
    case 1
        x = linspace(-1,1);   y = x;
        [X,Y] = meshgrid(x,y); 
        Z = X.^2 + Y.^2;
        figure
        mesh(X,Y,Z) 
        title('graf f(x,y) = x^2 + y^2')
        figure 
        contour(X,Y,Z)
        colorbar('southoutside')
        title('vrstevnice f(x,y) = x^2 + y^2')
    case 2
        x = linspace(-1,1);   y = x;
        [X,Y] = meshgrid(x,y);
        Z = X.^4 + X.^2 + Y.^2;
        figure
        mesh(X,Y,Z) 
        title('graf f(x,y) = x^4 + x^2 + y^2')
        figure 
        contour(X,Y,Z)
        colorbar('southoutside')
        title('vrstevnice f(x,y) = x^4 + x^2 + y^2')
    case 3
        x = linspace(-.3,.3);    y = linspace(-1,1);
        [X,Y] = meshgrid(x,y); 
        Z = 100*X.^4 + Y.^2;
        figure
        mesh(X,Y,Z) 
        title('graf f(x,y) = 100*x^4 + y^2')
        figure 
        contour(X,Y,Z)
        colorbar('southoutside')
        title('vrstevnice f(x,y) = 100*x^4 + y^2')
    case 4
        x = linspace(-pi,pi);    y = x;
        [X,Y] = meshgrid(x,y);
        Z = sin(X).^2 + cos(Y).^2;
        figure
        mesh(X,Y,Z)
        title('graf f(x,y) = sin(x)^2 + cos(y)^2')
        figure
        contour(X,Y,Z)  
        colorbar('southoutside')
        title('vrstevnice f(x,y) = sin(x)^2 + cos(y)^2')
    case 5
        x = linspace(-20,20);    y = x;
        [X,Y] = meshgrid(x,y);
        Z = 100*(Y - X.^2).^2 + (1 - X).^2;
        figure
        mesh(X,Y,Z)
        title('graf Rosebrockovy funkce')
        figure
        contour(X,Y,Z)  
        colorbar('southoutside')
        title('vrstevnice Rosebrockovy funkce')  
     case 6
        x = linspace(-0.5,4);    y = linspace(-2,2);
        [X,Y] = meshgrid(x,y);
        Z = 10*(X - Y.^2).^2 + (4 - X).^2;
        figure
        mesh(X,Y,Z)
        title('graf zadane funkce')
        figure
        contour(X,Y,Z)  
        colorbar('southoutside')
        title('vrstevnice zadane funkce') 
    otherwise
        fprintf('Spatna volba funkce.\n')
end


