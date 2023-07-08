function Ae = alok1d_quad(x,ke)

h = x(2)-x(1);
Ae = (ke/h) * [7/3,-8/3,1/3;-8/3,16/3,-8/3;1/3,-8/3,7/3];