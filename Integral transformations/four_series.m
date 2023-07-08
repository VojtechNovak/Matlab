syms t n

T = 3*pi;
w0 = pi/T;
n = 0:5;

c0 = (1/T)*int(sin(t),t,0,pi) + (1/T)*int(-2,t,pi,3*pi)

an = (1/T)*int(sin(t)*cos(n*w0*t),t,-pi,pi) + (1/T)*int(-2*cos(n*w0*t),t,-3*pi,-pi) + (1/T)*int(2*cos(n*w0*t),t,pi,3*pi)

bn = (1/T)*int(sin(t)*sin(n*w0*t),t,-pi,pi) + (1/T)*int(-2*sin(n*w0*t),t,-3*pi,pi) + (1/T)*int(2*sin(n*w0*t),t,pi,3*pi)

An = sqrt(an.^2 + bn.^2)

FIn = atan(bn./an)