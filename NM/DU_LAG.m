x= -3:0.1:3;
%%% Zadana funkce
xbody = [-3; -2; 0; 1];
ybody = [-9; 2; 0; -1]; 
x0 = -3;
y0 = -9;
x1=-2;
y1=2;
x2=0;
y2=0;
x3=1;
y3=-1;
%% 1. stupen
hold on
LL1 = (x-x1)/(x0-x1)*y0;
LL2 = (x-x0)/(x1-x0)*y1;
plot(x,LL1,'r-','LineWidth',2)
plot(x,LL2,'b-','LineWidth',2)
%% 2. stupen
L1 = (x-x1).*(x-x2)/((x0-x1)*(x0-x2))*y0;
L2 = (x-x0).*(x-x2)/((x1-x0)*(x1-x2))*y1;
L3 = (x-x0).*(x-x1)/((x2-x0)*(x2-x1))*y2;
LPOLYNOM = L1+L2+L3;
figure;
hold on
plot(x,L1,'r-','LineWidth',2)
plot(x,L2,'b-','LineWidth',2)
plot(x,L3,'g-','LineWidth',2)
plot(x,LPOLYNOM,'m--','LineWidth',4)
legend('L1','L2','L3')

%% 3. stupen
LLL1 = (x-x1).*(x-x2).*(x-x3)/((x0-x1)*(x0-x2)*(x0-x3))*y0;
LLL2 = (x-x0).*(x-x2).*(x-x3)/((x1-x0)*(x1-x2)*(x1-x3))*y1;
LLL3 = (x-x0).*(x-x1).*(x-x3)/((x2-x0)*(x2-x1)*(x2-x3))*y2;
LLL4 = (x-x0).*(x-x1).*(x-x2)/((x3-x0)*(x3-x1)*(x3-x2))*y3;
POLY = LLL1+LLL2+LLL3+LLL4;
figure;

hold on
scatter(xbody,ybody,'filled','d','LineWidth',50)
plot(x,LLL1,'r-','LineWidth',1)
plot(x,LLL2,'b-','LineWidth',1)
plot(x,LLL3,'g-','LineWidth',1)
plot(x,LLL4,'k-','LineWidth',1)
plot(x,POLY,'m--','LineWidth',2)
legend('body','L1','L2','L3','L4','POLYNOM')