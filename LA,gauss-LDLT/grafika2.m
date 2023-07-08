x=linspace(0, 2*pi);
y = sin(x);
plot(x,y,'r:', 'LineWidth', 2)
hold on;
x=linspace(pi, 3*pi);
y = cos(x);
plot(x,y,'k--', 'LineWidth', 2)
title('Funkce sinus a cosinus');
xlabel('-1<x<10');
ylabel ('Hodnota funkci');
legend('sin(x)', 'cos(x)');
xlim([-1 10]);
ylim([-1.1 1.1]);
grid on;