% Jmeno: Vojt?ch Novák
% Login: NOV0488
% Datum: 24/3/2020

B = [1 3 4 2 6 5 8 7 ];
sortedB = sort(B); % serazeni pro median
m = length (B);
soucetB = 0;
Median = 0;

for j = 1:m
    soucetB = soucetB + B(j);
end
%Mean...expected value
MeanB = soucetB/m;
median
% definice ... Median of a sorted array of size n is defined as
%the middle element when n is odd and average of middle two elements when n is even.

if mod(m,2) ~= 0   % kdyz je delka vektoru liche cislo
X = m/2+1/2;       % Median je lichy => median je prostredni element
for k=1:m
    if X == k
        Median = sortedB(k);
    end
end
end
if mod(m,2) == 0           % suda delka
    X = m/2;               % Median je prumer dvou prostrednich elementu
for i=1:m
    if X == i || X+1 == i
        Median = Median + sortedB(i);
    end
end
Median = Median/2;
end

% Smerodatna odchylka (funkce std())
s0 = 0;
for i=1:m
    s0 = s0 + (B(i)- MeanB)^2;
end
s0 = sqrt(s0/(m-1));
s1 = std(B); % kontrola


