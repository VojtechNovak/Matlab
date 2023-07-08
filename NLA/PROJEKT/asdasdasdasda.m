l = [ 10; 20 ;30 ;50 ;60];
T = [0.634;0.8966;1.0981;1.4176;1.5529];
dT = [0.104;0.068;0.057;0.049;0.045;0.04;0.035;0.03;0.02;0.01;0];
dtp = [14.1; 7.1; 5.1; 3.5; 2.9];
y = zeros(101,1);

scatter(l,T);
ylim([-0.5 2.5]);
xlim([0 100 ]);
hold on
plot(0:10:100,dT);
line(0:100,y);
line(0:100,y);

xlabel('Delka zavesu [cm]');
ylabel('Doba kmitu(s)');
legend('Namerene hodnoty', 'Interpolace splinem','Teoreticka','Chybova primka');
grid on
