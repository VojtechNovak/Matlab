%***************************************************************************
% DAVID HORAK                         30.11.1998
% casove frakvencni spektrum superponovaneho signalu s prvocisel. frekvencemi
% cfs.m
 x1=0*pi:2*pi/100:2*pi;
 x2=2*pi:2*pi/100:4*pi;
 x3=4*pi:2*pi/100:6*pi;
 
 x1=x1(1,1:100);
 x2=x2(1,1:100);
 x3=x3(1,1:100);
 
 %f=[sin(13*x1)+0.8*sin(23*x1)+0.6*sin(33*x1) sin(13*x2)+0.8*sin(23*x2)+0.6*sin(33*x2) sin(13*x3)+0.8*sin(23*x3)+0.6*sin(33*x3)];
 f=[sin(13*x1) 0.8*sin(23*x2) 0.6*sin(33*x3)];
% f=[sin(9*x1) sin(9*x2)+0.8*sin(23*x2) sin(9*x3)+0.8*sin(23*x3)+0.6*sin(37*x3)];
%***************************************************************************

% Generovani vstupniho signalu

clear i;
n=size(f,2);
  %n=302;                  % delka signalu
  N=20;                    % delka okna
  tau=10;                   % posunuti okna

% vygenerovani jedne ze slozek a prirazeni do f
  %f=op2z';
%  fprimsig; 
%   fchhod;

% Vykresleni vstupniho signalu (jedne slozky)
  figure
  plot(f,'r');
  axis([0 n min(f) max(f)]);
  title('Signál')
%  axis([0 n -2.5 2.5]);

% Fourierova transformace vstupniho signalu--------------------------------
  F=fft(f);
  F=abs(F(1:n/2));
  figure
  plot(F,'r');
  axis([0 n/2 0 max(F)]);
  title('FFT signálu')
%---------------------------------------------------------------------------
% Generovani okenni funkce

  disp('1-OBDELNIK, 2-BLACKMANN-HARRISON, 3-HAMMINGOVO, 4-PLOCHY VRCH, 5-GAUSS');
  cg=input('Zadejte poradove cislo okna pro okenni transformaci:     ');

  if (cg==1) g=gcw(N,1,1,0,0,0,0);                 nazev='Obdelnikove okno';end
  if (cg==2) g=gcw(N,1,1,1.36109,0.39381,0.03256,0);nazev='Blackmann-Harrisovo okno';end
  if (cg==3) g=gcw(N,1,1,0.84,0,0,0);              nazev='Hammingovo okno';end
  if (cg==4) g=gcw(N,1,1,1.93,1.29,0.388,0.0322);  nazev='Plochy vrch';end
  if (cg==5) g=gauss(N-1,1);                       nazev='Gaussovske okno';end


% Normovani okna
  norma=norm(g,2);
%  norma=norm(g,inf);
%  norma=N-1;
g(:)=g(:)/norma;
%---------------------------------------------------------------------------
% Vypocet matice Four. koeficientu W:

  w1=2*pi/N;
  W=[];
  for l=1:n/tau
    for j=1:N/2
      W(l,j)=0;
      for k=1:N
        tk=(l-1)*tau-N/2+k;
        if (tk > 0) & (tk < n) 
          W(l,j)=W(l,j)+f(tk)*g(k)*exp(-i*w1*j*tk);   % misto tk bylo t(tk)
        end
      end
    end
  end
  W=W';
%---------------------------------------------------------------------------
% Zobrazeni vyhlazeneho signalu, jeho spektra a casove-frekv. spektra

% Vyhlazeni signalu

  fc=[];
  for l=1:n/tau
    fc(l)=0;
    for k=1:N
      tk=(l-1)*tau-N/2+k;
      if (tk > 0) & (tk < n) 
        fc(l)=fc(l)+f(tk)*g(k);
      end
    end
  end
  fconv=interp(fc,2);
  figure
  plot(fconv,'r');
  axis([0 n min(fconv) max(fconv)]);
  title('Vyhlazeny signal')
%---------------------------------------------------------------------------
% Fourierova transformace vyhlazeneho signalu

  Fconv=fft(fconv);
  Fconv=abs(Fconv(1:n/tau));
  figure
  plot(Fconv,'r');
  axis([0 n/2 0 max(Fconv)]);
  title('FFT vyhlazeneho signalu')

%---------------------------------------------------------------------------
% Casove-frekvencni spektrum signalu

  for i=1:n/tau
    Wtemp(:,2*i-1)=W(:,i);
    Wtemp(:,2*i)=W(:,i);
  end;

  [X,Y] = meshgrid(1:20:n, 1:N/2);
  [x,y] = meshgrid(1:n, 1:N/2);

%  Za=interp2(x,y,abs(Wtemp),X,Y);
  Za=interp2(abs(Wtemp),X,Y);


  figure
  mesh(X,Y,Za);
  surf(X,Y,Za);
  shading interp;
  axis([1 n 1 N/2 0 max(max(Za))]);
  
   title('Casove-frekvencni spektrum, abs');
  xlabel('time');
  ylabel('level');
  zlabel('amplitude');
  colorbar;

  figure;
  mesh(X,Y,Za);
  surf(X,Y,Za);
  shading interp;
  axis([1 n 1 N/2 0 max(max(Za))]);
 title('Casove-frekvencni spektrum, abs, view(0,90)');
  view(0,90);
  xlabel('time');
  ylabel('level');
  zlabel('amplitude');
  colorbar;

%---------------------------------------------------------------------------
% Vypocet rozptylu a stredni hodnoty a vykresleni vyhlazene slozky 
  
  rozdil=fconv-f;
  figure
  plot(rozdil,'r');
  axis([0 n min(rozdil) max(rozdil)]);
  axis([0 n -2.5 2.5]);
  mean(rozdil)
  std(rozdil)
  DF=norm(rozdil,2)^2