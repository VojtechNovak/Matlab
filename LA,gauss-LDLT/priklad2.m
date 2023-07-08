
L = 1; % delka struny
f = @(x)-ones(size(x)); % funkce hustoty pusobicich sil
ns = 1e3:1e3:1e4;

cas_inverze = zeros(size(ns));
cas_resic = zeros(size(ns));
for i = 1:length(ns)
    n = ns(i);
    disp(['resim pro n = ' num2str(n)]);

    [A,b] = sestav_strunu(n,L,f);

    tic
    uh1 = A\b;
    cas_resic(i) = toc;

    tic
    uh2 = inv(A)*b;
    cas_inverze(i) = toc;

    disp([' - rozdil: ' num2str(norm(uh1-uh2,2))])
end    

figure
hold on
title('vypocetni cas')
plot(ns,cas_resic,'bo-')
plot(ns,cas_inverze,'ro-')
xlabel('n')
ylabel('cas [s]')
legend('resic soustavy','inverzi')
set(gca,'yscale','log')
hold off



