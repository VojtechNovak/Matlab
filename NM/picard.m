x = 1:0.1:2;
% pro kontraktivnost metody musi byt lokalni derivace mensi nez 1
dg = abs(-1./(sqrt(6-2*x))); % derivace 

max(dg) % derivace je mensi nez 1 pro kazde x na intervalu
figure()
plot(x,f(x))

figure()
ylin = x;
plot(x,ylin,'b-','LineWidth',2)
hold on
plot(x,g(x),'r-','LineWidth',2)

x1 = 1;
x2 = g(x1);

iter = 0;

while abs(x2-x1) > 1e-2
    plot([x1 x1],[x1 g(x1)],'k-')
    plot([x1 x2],[x1 g(x2)],'k--')
    pause(0.1)
    x1 = x2;
    x2 = g(x1);
    iter = iter +1;
end
% vysledne x2 kdyz dosadime do f(x2) dostaneme koren
function out = f(x)
out = x.^2 + 2*x-6;
end

function out = g(x)
out = sqrt(6-2*x);
end