%Computing values of representation errors
x = logspace(-2, 2, 1000);
y = (exp(x) ./ x.^2 ) - (x.^3);

% Computing maximum error
Tx = abs((x .* exp(x) - 2 .* exp(x) - 3 * x.^5) ./ (exp(x) - x.^5));
max_abs_error = abs(y .* Tx .* double(eps(single(1))) / 2); 
max_rel_error = abs(max_abs_error ./ y) ;

% Computing real error
y_dist = (exp(double(single(x)))./double(single(x)).^2 )-(double(single(x)).^3);
abs_error = abs(y - y_dist);
rel_error = abs(abs_error ./ y);


% Plotting the results
plot(x, rel_error, 'Color', 'red', 'LineWidth', 1.5);
hold on;
plot(x, max_rel_error, 'Color', 'blue', 'LineWidth', 1.5);
set(gca, 'XScale', 'log', 'YScale', 'log');
legend('real error', 'maximum error T(x)'), xlabel('x'), ylabel('δ'), title('Task 2')

% Save the plot as a JPEG file
exportgraphics(gcf, 'Task2Plot.jpg', 'Resolution', 600);