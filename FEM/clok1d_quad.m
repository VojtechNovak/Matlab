function ce = clok1d_quad(x,fe)

h = x(2)-x(1);
ce = (fe*h/2) * [1/6;2/3;1/6];