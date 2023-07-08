N=2^20;

x1=0*pi:2*pi/N:2*pi;
x2=2*pi:2*pi/N:4*pi;
x3=4*pi:2*pi/N:6*pi;
% f=sin([x1 x2 x3])';
% f=[sin(13*x1)+0.8*sin(23*x1)+0.6*sin(33*x1) sin(13*x2)+0.8*sin(23*x2)+0.6*sin(33*x2) sin(13*x3)+0.8*sin(23*x3)+0.6*sin(33*x3)]';
f=[sin(13*x1) 0.8*sin(23*x2) 0.6*sin(33*x3)]';
f=f(1:N);



%cf=fft(f);
cf1 = myfft(f);

%plot(abs(cf(1:N)));

%figure
%plot(abs(cf1(1:N)));