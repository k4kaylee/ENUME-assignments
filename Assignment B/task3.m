clc, clearvars, close all

Nx = 100;
R = 100;
Nsigma = 100;
Knum = 5;
Xmax = 1;
K_values = round(linspace(2, 8, Knum))';
sigma_sq_values = logspace(-30, -2, Nsigma)';
x_values = linspace(-Xmax, Xmax, Nx)';
y_values = f27(x_values);

expected_e_values = zeros(Knum, Nsigma);


for i = 1:length(sigma_sq_values)
    sigma_sq = sigma_sq_values(i);
    for j = 1:length(K_values)
        K = K_values(j);
        
        Phi = get_phi(x_values, K);
        e_sum = 0;
        for r = 1:R
            delta = sqrt(sigma_sq) * randn(1, Nx)';
            y_cor_values = y_values + delta;
            p_values = Phi \ y_cor_values;
            yp_values = Phi * p_values;
            
            e_sum = e_sum + get_e(y_values, yp_values);
        end
        expected_e_values(j, i) = sqrt(e_sum ./ R);
    end
end

% Plotting
colors = {'b', 'g', 'r', 'c', 'm'}; 


for k = 1:Knum
  plot(sigma_sq_values, expected_e_values(k, :), colors{k}, 'DisplayName', ['K = ', num2str(K_values(k))], 'LineWidth', 1.5);
  hold on;
end

set(gca, 'FontSize', 18);


xlabel('$\sigma^2$', 'Interpreter', 'latex', 'FontSize', 30);
ylabel('$\bar{e}$', 'Interpreter', 'latex', 'FontSize', 30);
title('Task 3', 'Interpreter', 'latex', 'FontSize', 30);
xscale("log");
yscale("log");


legend('show', 'Location', 'SouthEast');

grid on;

set(gcf, 'Position', [0 0 1600 900]);
saveas(gcf, 'task3.jpg');
