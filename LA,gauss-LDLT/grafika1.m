x = linspace(2*pi, 4*pi);
y = sin(x).*cos(x);

plot(x,y,'g--', 'LineWidth',2 )
title('graf funkce');
xlabel('x');
ylabel('sin(x)*cos(x)');
xlim([5 14])
ylim([-0.6 0.6])
grid on;