clc; clearvars; close all;

Nx = 100;
K_values = [2; 4; 6];
Xmax_values = [0.5; 1; 1.5];

J_matrix = get_J(K_values, Xmax_values, Nx);

% Plot the results
set(gca, 'FontSize', 18);
figure(1);
hold on;
grid on;
yscale('log');
title('Task 1', 'Interpreter', 'latex', 'FontSize', 30);
legend('Interpreter', 'latex', 'FontSize', 18, 'Location', 'SouthEast'),
xlabel('$x_{max}$', 'Interpreter', 'latex', 'FontSize', 30),
ylabel('$J$', 'Interpreter', 'latex', 'FontSize', 30);

colors = [[1 0 0]; [0 1 0]; [0 0 1]]; % red, green, blue

for i = 1:length(K_values)
    plot(Xmax_values, J_matrix(i, :), '-o', 'MarkerSize', 6, ...
         'MarkerFaceColor', colors(i, :), 'Color', colors(i, :), ...
         'DisplayName', sprintf('$K=%d$', K_values(i)), 'LineWidth', 1.5);
end


set(gcf, 'Position', [0 0 1600 900]);
saveas(gcf, 'task1.jpg');