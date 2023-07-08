A = [9 -1 2 0 0 0 0 0 0 0;
    -1 9 -1 2 0 0 0 0 0 0;
    2 -1 9 -1 2 0 0 0 0 0;
    0 2 -1 9 -1 2 0 0 0 0;
    0 0 2 -1 9 -1 2 0 0 0;
    0 0 0 2 -1 9 -1 2 0 0;
    0 0 0 0 2 -1 9 -1 2 0;
    0 0 0 0 0 2 -1 9 -1 2;
    0 0 0 0 0 0 2 -1 9 -1;
    0 0 0 0 0 0 0 2 -1 9];

%% Gershgorin Disk Theorem
Lambda = eig(A); %Computing true eigenvalues of desired Matrix 'A'
%%% Obtaining the centers of disks
X = real(diag(A));  
Y = imag(diag(A));
%%% Obtaining the radius of disks
R = sum(abs(A),2)-abs(diag(A)); 
%% Ploting Results
%%% Plot the location of true eigenvalues in real-imaginary coordinate(X axis==real part , Y axis==imaginary part)
plot(real(Lambda),imag(Lambda),'or');hold on
%%% Plot the centers of disks approximated by Gershgorin Theorem
plot(X,Y,'k*');
%%%% To plot the disks, we use polar coordinate eqution of a circle
N = 300;
t = 0:2*pi/N:(2*pi)-(2*pi/N);
X1 = X+R.*repmat(cos(t),size(R,1),1);
Y1 = Y+R.*repmat(sin(t),size(R,1),1);
plot(X1',Y1','b-')
axis equal; hold off
xlabel('Real');  ylabel('Imaginary')
title('Gershgorin Disk')
legend('Actual Eigenvalues','Center of Disks','Disks')
grid on