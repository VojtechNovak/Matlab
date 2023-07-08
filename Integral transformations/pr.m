syms t n

T = 2;
w0 = 2*pi/T;
n = 0:2;

c0 = (1/T)*int(t,t,0,1)

an = (2/T)*int(t*cos(n*w0*t),t,0,1)

bn = (2/T)*int(t*sin(n*w0*t),t,0,1)

An = sqrt(an.^2 + bn.^2)

FIn = atan(bn./an)