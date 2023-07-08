% Casove frekvencni spektrum


%% Ukazkove signaly
n=8; N=2^n;
%t=(fix(-N/2):fix(N/2-1));
t=(0:N-1)'; % Diskretni promenna (sloupcovy vektor)
w1=2*pi/N*8; w2=2*pi/N*40; w3=2*pi/N*80;
f1=sin(w1*t)+sin(w2*t)+sin(w3*t); % Diskretni funkce
f2=sin(w1*t);
f2(fix(N/4):fix(3*N/4))=f2(fix(N/4):fix(3*N/4))+0.3*sin(w3*t(fix(N/4):fix(3*N/4)));
f2(fix(N/2):N-1)=f2(fix(N/2):N-1)+0.3*sin(w2*t(fix(N/2):N-1));

%% hladiny 

f3 = R(1,:)';
f4 = R(2,:)';
f5 = R(3,:)';
f6 = R(4,:)';
%% Vytvoreni oken
M=64; % Pocet bodu, na nichz bude okno realizovano
th=(1:M)'; % Diskretni promenna okenni funkce
% Obdelnikove okno
h1=ones(size(th)); h1=h1/sum(h1);
% Trojuhelnikove okno
h2=[1:ceil(M/2),floor(M/2):-1:1]'; h2=h2/sum(h2);
% Hanningovo okno
h3=[1-cos(2*pi*th/(M+1))]; h3=h3/sum(h3);
% Hammingovo okno
h4=[1-0.84*cos(2*pi*th/(M+1))]; h4=h4/sum(h4);


% Nastaveni zbyvajicich parametru diskretni okenni Fourierovy transformace
  % Posun okna o wstep bodu
stepw=1;%fix(M/4);
  % Pocet oken
nw=fix( (N-(M-stepw))/stepw );


% Prima transformace
F1=fft(f3);
F2=fft(f4);
F3=fft(f5);
F4=fft(f6);
% Vypocet ampl. spektra
F1_am=abs(F1)/(N/2);
F2_am=abs(F2)/(N/2);
F3_am=abs(F3)/(N/2);
F4_am=abs(F4)/(N/2);

% Matice Fourierovych koeficientu
c1=zeros(nw,M); c2=zeros(nw,M); c3=zeros(nw,M); c4=zeros(nw,M); i=0;
for m=1:nw
  c1(m,:)=( fft(f3(i+1:i+M).*h3) )';
  c2(m,:)=( fft(f4(i+1:i+M).*h3) )';
  c3(m,:)=( fft(f5(i+1:i+M).*h3) )';
  c4(m,:)=( fft(f6(i+1:i+M).*h3) )';
  i=i+stepw;
end;  

cabs1=abs(c1(:,1:M/2))';
cabs2=abs(c2(:,1:M/2))';
[t_,w_]=meshgrid((0:nw-1)/(nw-1)*N,(1:M/2)*N/M);
[tg,wg]=meshgrid(0:N-1,1:4);
cabsg1=interp2(t_,w_,cabs1,tg,wg);
cabsg2=interp2(t_,w_,cabs2,tg,wg);

% Graficke zobrazeni
figure(1);
  subplot(2,2,1);
    hold on
    axis([min(t) max(t) min(f3) max(f3)]);
    title('první hladina','FontName','@MS Mincho','FontSize',14);
    plot(t,f3,'k-');
  subplot(2,2,2);
    hold on
    axis([min(t) max(t) min(f4) max(f4)]);
    title('druhá hladina','FontName','@MS Mincho','FontSize',14);
    plot(t,f4,'k-');
  subplot(2,2,3);
    hold on
    axis([0 N/2-1 min(F1_am(1:N/2)) max(F1_am(1:N/2))]);
    title('Amplitudové spektrum 1. hladiny','FontName','@MS Mincho','FontSize',12);
    bar(0:N/2-1,F1_am(1:N/2));
  subplot(2,2,4);
    hold on
    axis([0 N/2-1 min(F2_am(1:N/2)) max(F2_am(1:N/2))]);
    title('Amplitudové spektrum 2. hladiny','FontName','@MS Mincho','FontSize',12);
    bar(0:N/2-1,F2_am(1:N/2));
  
  figure(2);
  subplot(2,2,1);
    hold on
    axis([min(t) max(t) min(f5) max(f5)]);
    title('hladina 3','FontName','@MS Mincho','FontSize',12);
    plot(t,f5,'k-');
  subplot(2,2,2);
    hold on
    axis([min(t) max(t) min(f6) max(f6)]);
    title('hladina 4','FontName','@MS Mincho','FontSize',12);
    plot(t,f6,'k-');
  subplot(2,2,3);
    hold on
    axis([0 N/2-1 min(F2_am(1:N/2)) max(F2_am(1:N/2))]);
    title('Amplitudové spektrum 3. hladiny','FontName','@MS Mincho','FontSize',12);
    bar(0:N/2-1,F2_am(1:N/2));
  subplot(2,2,4);
    hold on
    axis([0 N/2-1 min(F4_am(1:N/2)) max(F4_am(1:N/2))]);
    title('Amplitudové spektrum 4. hladiny','FontName','@MS Mincho','FontSize',12);
    bar(0:N/2-1,F4_am(1:N/2));
    
  figure(3)
    hold on; grid on;
    view(3); rotate3d; box; grid on;
    axis([0 N 0 N/2 0 max(max(cabsg1))]);
    surf( tg,wg,cabsg1, 'EdgeColor','interp' );
    title('casove frekvencní spektrum signálu','FontName','@MS Mincho','FontSize',12)
    xlabel('t_m'); ylabel('\omega_n'); zlabel('c_{mn}');
    %colorbar;
    
    %% cfs
    
    surf( t,1:4,abs(R), 'EdgeColor','interp' );
    title('casove frekvencní spektrum signálu','FontName','@MS Mincho','FontSize',12)
    xlabel('time'); ylabel('Sublevels'); zlabel('Amplitude');