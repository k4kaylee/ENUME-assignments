clf, clc, clearvars, close all
x = logspace(-2, 2, 10000);
y = (exp(x)./x.^2 )-(x.^3);

% Maximum error method 1 4.*exp(x) ./ (exp(x) - x.^5)
Ka1 = 1 + 3.*abs(exp(x)./(exp(x) - x.^5)) + abs(x.^5 ./ (exp(x) - x.^5));
max_abs_error_a1 = abs(y .* Ka1 .* double(eps(single(1))) ./ 2); 
max_rel_error_a1 = abs(max_abs_error_a1 ./ y);

% Real error method 1
v1 = double(single(exp(x)));
v2 = double(single(x.^2));
v3 = double(single(v1 ./ v2));
v4 = double(single(x.^3));
ys_a1 = double(single(v3 - v4));
abs_error_a1 = abs(y - ys_a1);
rel_error_a1 = abs(abs_error_a1 ./ y);

% Maximum error method 2
Ka2 = 3 + abs(exp(x) ./ (exp(x) - x.^5))+ abs(x.^5 ./ (exp(x) - x.^5));
max_abs_error_a2 = abs(y .* Ka2 .* double(eps(single(1))) ./ 2); 
max_rel_error_a2 = abs(max_abs_error_a2 ./ y);

% Real error method 2
v1 = double(single(exp(x)));
v2 = double(single(x .^5));
v3 = double(single(v1 - v2));
v4 = double(single(x .^2));
ys_a2 = double(single(v3 ./ v4));
abs_error_a2 = abs(y - ys_a2);
rel_error_a2 = abs(abs_error_a2 ./ y);


sgtitle('Task 4') 

% Plot errors for A1
subplot(2,1,1)
hold on;
plot(x, rel_error_a1, 'Color', 'red', 'LineWidth', 1.5);
plot(x, max_rel_error_a1, 'Color', 'blue', 'LineWidth',1.5);
set(gca, 'XScale', 'log', 'YScale', 'log');
legend('real error', 'maximum error'), xlabel('x'), ylabel('δ'), title('A1')
hold off

% Plot errors for A2
subplot(2,1,2)
hold on;
plot(x, rel_error_a2, 'Color', 'red', 'LineWidth', 1.5);
plot(x, max_rel_error_a2, 'Color', 'blue', 'LineWidth',1.5);
set(gca, 'XScale', 'log', 'YScale', 'log');
legend('real error', 'maximum error'), xlabel('x'), ylabel('δ'), title('A2')
hold off


% Save A2 plot as a JPEG file
exportgraphics(gcf, 'Task4A2Plot.jpg', 'Resolution', 2000);
