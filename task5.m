clf, clc, clearvars, close all
x = logspace(-2, 2, 10000);

Tx = abs((x .* exp(x) - 2 .* exp(x) - 3 * x.^5) ./ (exp(x) - x.^5));
Ka1 = 1 + 3.*abs(exp(x)./(exp(x) - x.^5)) + abs(x.^5 ./ (exp(x) - x.^5));
Ka2 = 3 + abs(exp(x) ./ (exp(x) - x.^5))+ abs(x.^5 ./ (exp(x) - x.^5));


hold on;
plot(x, Tx, 'Color', 'magenta', 'LineWidth', 1.5);
plot(x, Ka1, 'Color', 'blue', 'LineWidth',1.5);
plot(x, Ka2, 'Color', 'green', 'LineWidth',1.5);
xscale('log')
yscale('log')
legend('Tx', 'Ka1', 'Ka2'), xlabel('x'), ylabel('δ'), title('Task 5')

% Save A2 plot as a JPEG file
exportgraphics(gcf, 'Task5.jpg', 'Resolution', 2000);