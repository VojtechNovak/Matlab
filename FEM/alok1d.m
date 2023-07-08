function Ae = alok1d(x,ke)

h = x(2)-x(1);
Ae = (ke/h) * [1,-1;-1,1];