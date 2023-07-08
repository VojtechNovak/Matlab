%% Metoda bisekce (p?lení intervalu)
function [aproximace,iterace,x]=MetodaBisekce(f,a,b,epsilon)
%Funkce MetodaBisekce ur?í p?ibližný ko?en rovnice f(x)=0 na intervalu
%<a,b> pomocí p?lení intervalu <a,b>. P?edpokladá se, že funkce f má na 
%intervalu <a,b> práv? jeden ko?en. Pokud má zadaná funkce f na intervalu
%<a,b> více než jeden ko?en, metoda najde jen jeden z nich nebo nenajde
%žádný ko?en.
%--------------------------------------------------------------------------
%vstupní parametry: f - funkce které ko?en hledáme
%                   a - po?áte?ní bod intervalu na kterém hledáme ko?en
%                   b - koncový bod intervalu na kterém hledáme ko?en
%                   epsilon - ukon?ující kritérium
%--------------------------------------------------------------------------
%výstup:            aproximace - postupné aproximace 
%                   iterace - po?et iterací pot?ebných na dosažení 
%                             p?esnosti epsilon
%                   x - p?ibližné ?ešení rovnice f(x)=0
%--------------------------------------------------------------------------
%spuštení nap?:     f=@(x)sin(pi*x)-exp(2*x).*x.^3+2
%                   [aproximace,iterace,x]=MetodaBisekce(f,0,1,1e-6)
%--------------------------------------------------------------------------

xx=a:0.001:b;                   % interval, na kterém vykreslujeme funkci f
figure
plot(xx,f(xx),'r');             % vykreslení f
hold on
plot(xx,zeros(size(xx)),'k');   % vykreslení x-vé osi

iterace=0;                      % po?et iterací (na za?átku nulový)

if f(a)==0                      % ko?en je po?áte?ní bod zadaného intervalu
    x=a;                        % ?ešení bude a (po?ate?ní bod intervalu)
    aproximace(1)=a;            
    plot(x,0,'ro')              % vykreslíme ko?en
    return; 
elseif f(b)==0                  % ko?en je koncový bod zadaného intervalu
    x=b;                        % ?ešení bude b (koncový) bod intervalu)
    aproximace(1)=b;
    plot(x,0,'ro')              % vykreslíme ko?en
    return;   
else 
    x=(a+b)/2;                  % aktuální aproximace ko?ene bude st?ed intervalu <a,b>
    aproximace(1)=x;   
end
    
while abs(f(x))>epsilon          % ukon?ující podmínka
    if f(a)*f(x)<0               % ko?en je v levé polovin? intervalu
        b=x;                     % po?áte?ní bod nového intervalu nem?ním, koncový bod nového intervalu bude b
    elseif f(x)*f(b)<0           % ko?en je v pravé polovin? intervalu
        a=x;                     % po?áte?ní bod nového intervalu bude a, koncový bod nového intervalu nem?ním
    else                         % v pravé i levé polovin? intervalu se nachází sudý po?et ko?en? nebo nenachází žádný ko?en
        x=[];                    % metoda bisekce nenajde žádný ko?en
        aproximace=[];
        log=['Zadaná funkce má na intervalu <',num2str(a),', ',num2str(b),'> víc než jeden ko?en nebo nemá žádný ko?en.'];
        disp(log)
        return;
    end
    x=(a+b)/2;                  % nová aproximace bude st?ed nového intervalu
    iterace=iterace+1;          % zvýšim po?et iterací
    aproximace(iterace+1)=x;
end

if ~isempty(aproximace)
    for i=1:iterace
        plot(aproximace(i),0,'b*','MarkerSize',4); % vykreslení postupných aproximací ko?ene
    end
    plot(x,0,'ro','MarkerFaceColor','r','MarkerSize',4)           % vykreslení p?ibližného ?ešení rovnice f(x)=0
end