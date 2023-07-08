%generuji data pro pi/4 QPSK v AWGN
eb = 0:5;
SER = [0.1447 0.1112 0.0722 0.0438 0.0243 0.0122];
BER = [0.0753 0.0574 0.0370 0.0222 0.0122 0.0061];
% Create a y-axis semilog plot using the semilogy function
% Plot SER data in blue and BER data in red
figure
semilogy(eb, SER, 'cx-', 'LineWidth', 2, 'MarkerSize', 8) %%% MOJE %%%
hold on
semilogy(eb, BER, 'rv:')    %%% MOJE %%%
% Turn on the grid
grid on
% Add title and axis labels
title('Performance of Baseband QPSK','Color','blue')  %%% MOJE %%%
xlabel('Eb/No (dB)') %%% MOJE %%%
ylabel('SER and BER')  %%% MOJE %%%
legend('SER','BER','Location', 'best');  %%% MOJE %%%


%_______________________________%%% MOJE %%%______________________________
ax=gca;
ax.FontSize = 12;
ax.TickDir = 'out';
ax.TickLength = [0.01 0.01];
ax.YLim = [0.005 0.2];
ax.XLim = [-2 7];

text(0, 0.015, 'BASEBAND MODULATION', 'Color', 'red', 'FontSize', 9)

%%% nahodne a prirozene rozdeleni %%%
N = 2000;
numBins = 20;

samplesUniform = rand(1,N);
samplesNormal = randn(1,N);

figure
subplot(2,1,1)
histogram(samplesUniform, numBins)

subplot(2,1,2)
histogram(samplesNormal, numBins)


