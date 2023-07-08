%****************************************************************************
% WFT.m                     DAVID HORAK                           5.5.1998
%****************************************************************************
disp('---------------------------------------------------------------------')
disp('                                                                     ')
disp('      O  K  E  N  N  I      T  R  A  N  S  F  O  R  M  A  C  E       ')
disp('                                                                     ')
disp('NABIDKA OKEN:                                                        ')
disp('        1.RECTANGULAR        7.TUKEY         13.SINUS-CARDINALIS     ')
disp('        2.BLACKMANN-HARRIS   8.RADAR         14.PARSEN1              ')          
disp('        3.HAMMING            9.BARLETT       15.PARSEN2              ') 
disp('        4.HANNING           10.TRIANGULAR    --16.TRANSIENT          ')
disp('        5.PLOCHY VRCH       11.CHEBYSHEV     --17.EXPONENTIAL        ')
disp('        6.KAISER-BESSEL     12.GAUSS                                 ')
disp('                                                                     ')
disp('Pozn.:  Okna c.1-7 jsou specialni pripady zobecneneho KOSINOVEHO okna') 
disp('                                                                     ')
disp('DELKA SIGNALU:                            DELKA OKNA:                ')
disp('        1.  80                                  1. 10                ')
disp('        2. 160                                  2. 20                ')
disp('        3. 240                                  3. 25                ')
disp('---------------------------------------------------------------------')
close all
clear
b='r';

cg=input('Zadejte poradove cislo okna pro okenni transformaci       :      ');
%cn=input('Zadej poradove cislo pocetu bodu signalu                  :      '); 
%cN=input('Zadej poradove cislo pocetu bodu okna                     :      ');

n=240;
N=20;

%if (cn==1) n= 80;end
%if (cn==2) n=160;end
%if (cn==3) n=240;end

%if (cN==1) N=10;end
%if (cN==2) N=20;end
%if (cN==3) N=40;end

% Generovani vstupniho signalu----------------------------------------------
krok=1/(n-1);
for i=1:n
  t(i)=(i-1)*krok;
  f(i)=sin(2*pi*3*t(i))*sin(2*pi*50*t(i));
%  f(i)=5*sin(2*pi*3*t(i))+2*sin(2*pi*20*t(i))+sin(2*pi*50*t(i));
%  f(i)=2*sin(2*pi*3*t(i))+0.5*sin(2*pi*30*t(i))+0.25*sin(2*pi*70*t(i));
end

%for i=1:N/2-1
%  f=[0 f];
%end;
%f

%cg=input('Zadejte poradove cislo okna pro okenni transformaci       :      ');
%n=527;
%cN=input('Zadej poradove cislo pocet bodu okna                      :      ');

%if (cN==1) N=10;end
%if (cN==2) N=20;end
%if (cN==3) N=40;end

% Generovani vstupniho signalu----------------------------------------------
%krok=1/(n-1);
%for i=1:n
%  t(i)=(i-1)*krok;
%end
%kal6a;
%f=1e+09*f;

figure
plot(t,f(1:n),b)
%grid
%title('Vstupni signal');
%xlabel('t');
%ylabel('f');

% Vytvoreni okna------------------------------------------------------------
if (cg==1) g=gcw(N,1,1,0,0,0,0);                 nazev='Obdelnikove okno';end
if (cg==2) g=gcw(N,1,1,1.36109,0.39381,0.03256,0);nazev='Blackmann-Harrisovo okno';end
if (cg==3) g=gcw(N,1,1,0.84,0,0,0);              nazev='Hammingovo okno';end
if (cg==4) g=gcw(N,1,1,1,0,0,0);                 nazev='Hanningovo okno';end
if (cg==5) g=gcw(N,1,1,1.93,1.29,0.388,0.0322);  nazev='Plochy vrch';end
if (cg==6) g=gcw(N,1,1,1.29,0.244,0.00305,0);    nazev='Kaiser-Besselovo okno';end
if (cg==7) g=gcw(N,1,0.54,0.46,0,0,0);           nazev='Tukyovo okno';end
if (cg==8) g=radar(N-1);                         nazev='Radarove okno';end
if (cg==9) g=bartlett(N);                        nazev='Bartlettovo okno';end
if (cg==10) g=triang(N);                         nazev='Trojuhelnikove okno';end
if (cg==11) g=chebwin(N-1,30);                   nazev='Chebyshovo okno';end
if (cg==12) g=gauss(N-1,1);                      nazev='Gaussovske okno';end
if (cg==13) g=sincard(N);                        nazev='Sinus-cardinalis okno';end
if (cg==14) g=parsen1(N-1,2);                    nazev='Parsenovo1 okno';end
if (cg==15) g=parsen2(N-1,2);                    nazev='Parsenovo2 okno';end
%if (cg==16) g=transient(N);                      nazev='Transient okno';end
%if (cg==17) g=exponent(N);                       nazev='Exponencialni okno';end
%if (cg==18) g=radar(N);                          nazev='Radarove okno';end

figure
plot(g,b);
grid
title('Signál');
xlabel('N');
ylabel('g');

% Fourieruv obraz okna------------------------------------------------------
G=fft(g);
figure
plot(1:N/2,abs(G(1:N/2)),b);
grid
title('Jednostranne amplitud. spektrum');
xlabel('N');
ylabel('IcI');

% Vyhlazeny signal----------------------------------------------------------
figure
fconv=conv(f,g);
plot(t,fconv(1:n),b);
grid
title(nazev);
xlabel('t');
ylabel('fconv');

% Fourierova transformace vstupniho signalu--------------------------------
F=fft(f);
figure
plot(abs(F(1:n/2)),b);
grid
title('Fourier. transformace vstup. signalu-amplit.spektrum');
xlabel('n');
ylabel('IcI');

% Fourierova transformace vyhlazeneho signalu------------------------------
Fconv=fft(fconv);
figure
plot(abs(Fconv(1:n/2)),b);
grid
title('Fourier. transformace vyhlazen. signalu-amplit.spektrum');
xlabel('n');
ylabel('IcI');

%plot(abs(conv(fft(y),fft(b))));