
n=input('Zadej n pro 2^n bodu:');
N=2^n;
T=input('Zadej transformaci:  ');

if(T=='R')  M=rad(n);    end
if(T=='W')  M=walsh(n);  end
if(T=='Wm') M=walshm(n); end
if(T=='H')  M=haar(n);   end
if(T=='F')  M=four(n);   end
%%
% Vygenerovani vektoru
x1=0*pi:2*pi/N:2*pi;
x2=2*pi:2*pi/N:4*pi;
x3=4*pi:2*pi/N:6*pi;
% f=sin([x1 x2 x3])';
% f=[sin(13*x1)+0.8*sin(23*x1)+0.6*sin(33*x1) sin(13*x2)+0.8*sin(23*x2)+0.6*sin(33*x2) sin(13*x3)+0.8*sin(23*x3)+0.6*sin(33*x3)]';
f=[sin(13*x1) 0.8*sin(23*x2) 0.6*sin(33*x3)]';
% f=[sin(9*x1) sin(9*x2)+0.8*sin(23*x2) sin(9*x3)+0.8*sin(23*x3)+0.6*sin(37*x3)]';
f=f(1:N);
figure
plot(f);
title('Signal')
%%
% Transformace
c=M*f;
figure
plot(abs(c(1:N)));
title('Spektrum')

% Porovnani s fft 
cf=fft(f);
figure
plot(abs(cf(1:N)));
title('Spektrum-fft')

% Zaneseni 10-procentni chyby 
cerr=c+0.1*max(abs(c))*(rand(N,1)-0.5);
figure
plot(abs(cerr(1:N)));
title('Spektrum zatiz. chybou')

% Zpetna transformace(rekonstrukce) chybou zatiz. koef.
ferr=M'*cerr;
figure
plot(real(ferr))
title('Signal-chyb. koef.')

% Tichonovova regularizace
e=2;
for i=1:N
  creg1(i,1)=(cerr(i,1))/(1+0.01*(i^e));  
  creg2(i,1)=(cerr(i,1))/(1+0.001*(i^e));  
  creg3(i,1)=(cerr(i,1))/(1+0.0001*(i^e));  
end
freg1=M'*creg1;
freg2=M'*creg2;
freg3=M'*creg3;

figure
plot(real(freg1))
title('Signal-freg1')
figure
plot(real(freg2))
title('Signal-freg2')
figure
plot(real(freg3))
title('Signal-freg3')
%%
% Create plots
subplot(2,2,1);
plot(f)
title('Signál')
subplot(2,2,2)
plot(real(freg1))
title('T-regularizace, alpha = 0.01')
subplot(2,2,3);
plot(real(freg2))
title('T-regularizace, alpha = 0.001')
subplot(2,2,4);
plot(real(freg3))
title('T-regularizace, alpha = 0.0001')
  