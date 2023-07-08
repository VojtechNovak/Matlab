%% Metoda bisekce (p?len� intervalu)
function [aproximace,iterace,x]=MetodaBisekce(f,a,b,epsilon)
%Funkce MetodaBisekce ur?� p?ibli�n� ko?en rovnice f(x)=0 na intervalu
%<a,b> pomoc� p?len� intervalu <a,b>. P?edpoklad� se, �e funkce f m� na 
%intervalu <a,b> pr�v? jeden ko?en. Pokud m� zadan� funkce f na intervalu
%<a,b> v�ce ne� jeden ko?en, metoda najde jen jeden z nich nebo nenajde
%��dn� ko?en.
%--------------------------------------------------------------------------
%vstupn� parametry: f - funkce kter� ko?en hled�me
%                   a - po?�te?n� bod intervalu na kter�m hled�me ko?en
%                   b - koncov� bod intervalu na kter�m hled�me ko?en
%                   epsilon - ukon?uj�c� krit�rium
%--------------------------------------------------------------------------
%v�stup:            aproximace - postupn� aproximace 
%                   iterace - po?et iterac� pot?ebn�ch na dosa�en� 
%                             p?esnosti epsilon
%                   x - p?ibli�n� ?e�en� rovnice f(x)=0
%--------------------------------------------------------------------------
%spu�ten� nap?:     f=@(x)sin(pi*x)-exp(2*x).*x.^3+2
%                   [aproximace,iterace,x]=MetodaBisekce(f,0,1,1e-6)
%--------------------------------------------------------------------------

xx=a:0.001:b;                   % interval, na kter�m vykreslujeme funkci f
figure
plot(xx,f(xx),'r');             % vykreslen� f
hold on
plot(xx,zeros(size(xx)),'k');   % vykreslen� x-v� osi

iterace=0;                      % po?et iterac� (na za?�tku nulov�)

if f(a)==0                      % ko?en je po?�te?n� bod zadan�ho intervalu
    x=a;                        % ?e�en� bude a (po?ate?n� bod intervalu)
    aproximace(1)=a;            
    plot(x,0,'ro')              % vykresl�me ko?en
    return; 
elseif f(b)==0                  % ko?en je koncov� bod zadan�ho intervalu
    x=b;                        % ?e�en� bude b (koncov�) bod intervalu)
    aproximace(1)=b;
    plot(x,0,'ro')              % vykresl�me ko?en
    return;   
else 
    x=(a+b)/2;                  % aktu�ln� aproximace ko?ene bude st?ed intervalu <a,b>
    aproximace(1)=x;   
end
    
while abs(f(x))>epsilon          % ukon?uj�c� podm�nka
    if f(a)*f(x)<0               % ko?en je v lev� polovin? intervalu
        b=x;                     % po?�te?n� bod nov�ho intervalu nem?n�m, koncov� bod nov�ho intervalu bude b
    elseif f(x)*f(b)<0           % ko?en je v prav� polovin? intervalu
        a=x;                     % po?�te?n� bod nov�ho intervalu bude a, koncov� bod nov�ho intervalu nem?n�m
    else                         % v prav� i lev� polovin? intervalu se nach�z� sud� po?et ko?en? nebo nenach�z� ��dn� ko?en
        x=[];                    % metoda bisekce nenajde ��dn� ko?en
        aproximace=[];
        log=['Zadan� funkce m� na intervalu <',num2str(a),', ',num2str(b),'> v�c ne� jeden ko?en nebo nem� ��dn� ko?en.'];
        disp(log)
        return;
    end
    x=(a+b)/2;                  % nov� aproximace bude st?ed nov�ho intervalu
    iterace=iterace+1;          % zv��im po?et iterac�
    aproximace(iterace+1)=x;
end

if ~isempty(aproximace)
    for i=1:iterace
        plot(aproximace(i),0,'b*','MarkerSize',4); % vykreslen� postupn�ch aproximac� ko?ene
    end
    plot(x,0,'ro','MarkerFaceColor','r','MarkerSize',4)           % vykreslen� p?ibli�n�ho ?e�en� rovnice f(x)=0
end