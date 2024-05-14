clc, clearvars, close all

N = 100;
Nk = 6;
Nx = 10;

K_values = round(linspace(2, 8, Nk));
Xmax_values = linspace(0.5, 2.5, Nx);

Error_delta = zeros(length(K_values), length(Xmax_values));
Error_p1_values = zeros(length(K_values), length(Xmax_values));
Error_p2_values = zeros(length(K_values), length(Xmax_values));


for j = 1:length(Xmax_values)
    Xmax = Xmax_values(j);

    x_values = linspace(-Xmax, Xmax, N)';
    y_values = f27(x_values);
    for i = 1:length(K_values)
        K = K_values(i);

        Phi = get_phi(x_values, K);

        p1_ = Phi \ y_values;
        y_p1_values = Phi * p1_;

        p2_ = (Phi' * Phi) \ (Phi' * y_values);
        y_p2_values = Phi * p2_;

        error_p1 = get_e(y_values, y_p1_values);
        error_p2 = get_e(y_values, y_p2_values);

        Error_p1_values(i, j) = error_p1;
        Error_p2_values(i, j) = error_p2;
        Error_delta(i, j) = get_e(y_values, y_p2_values) - get_e(y_values, y_p1_values);
    end
end

colors = rand(Nk, 3);

figure(1);
set(gca, 'FontSize', 18);

% Plotting p1
grid on;
title('$e_{p_1}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold'),
yscale('log'), legend('Interpreter', 'latex', 'Location', 'SouthEast'),
xlabel('$x_{max}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold'),
ylabel('$e_{p_1}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold'),

hold on

for i = 1:length(K_values)
    plot(Xmax_values, Error_p1_values(i, :), 'Color', colors(i, :), 'DisplayName', sprintf('$K=%d$', K_values(i)), 'LineWidth', 1.5)
end

hold off

set(gcf, 'Position', [0 0 1600 900]);
saveas(gcf, 'task4_p1.jpg');

clf;

% Plotting p2
set(gca, 'FontSize', 18);
grid on;
title('$e_{p_2}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold'),
yscale('log'), legend('Interpreter', 'latex', 'Location', 'SouthEast'),
xlabel('$x_{max}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold'),
ylabel('$e_{p_2}$', 'Interpreter', 'latex', 'FontSize', 30, 'FontWeight', 'bold'),

hold on

for i = 1:length(K_values)
    plot(Xmax_values, Error_p2_values(i, :), 'Color', colors(i, :), ...
        'DisplayName', ...
        sprintf('$K=%d$', K_values(i)), 'LineWidth', 1.5)
end

hold off

set(gcf, 'Position', [0 0 1600 900]);
saveas(gcf, 'task4_p2.jpg');

clf;


% Delta (p2 - p1)
set(gca, 'FontSize', 18);
grid on;
title('$\Delta e$', 'Interpreter', 'latex', 'FontSize', 30),
legend('Interpreter', 'latex', 'Location', 'SouthEast'),
xlabel('$x_{max}$', 'Interpreter', 'latex', 'FontSize', 30),
ylabel('$e_{p_2}$ - $e_{p_1}$', 'Interpreter', 'latex','FontSize', 30),
hold on
for i = 1:length(K_values)
    plot(Xmax_values, Error_delta(i, :), 'Color', colors(i, :), ...
        'DisplayName', ...
        sprintf('$K=%d$', K_values(i)), 'LineWidth', 1.5)
end
hold off


set(gcf, 'Position', [0 0 1600 900]);
saveas(gcf, 'task4_delta.jpg');


