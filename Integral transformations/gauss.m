%***************************************************************************
%  gauss- generalized cosine window          DAVID HORAK          5.5.1998
%***************************************************************************
function g=gauss(N,a)

krok=pi/(N-1);
for i=1:N+1
  t(i)=(i-N/2-1)*krok;
  g(i)=((2*a)^(1/4))*exp(-pi*a*t(i)*t(i));
end

%plot(g);