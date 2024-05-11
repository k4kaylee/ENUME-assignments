clc, clearvars, close all

Nx = 100;
R = 100;
Nsigma = 10;
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
            delta = randn(1, Nx)' * sqrt(sigma_sq);
            y_cor_values = y_values + delta;
            p_values = Phi \ y_cor_values;
            yp_values = Phi * p_values;
            
            e_sum = e_sum + get_e(y_values, yp_values);
        end
        expected_e_values(i, j) = sqrt(e_sum ./ R);
    end
end

colors = {'b', 'g', 'r', 'c', 'm'}; 

for k = 1:Knum
  plot(sigma_sq_values, expected_e_values(k, :), colors{k}, 'DisplayName', ['K = ', num2str(K_values(k))]);
  hold on;
end


xlabel('\sigma^2');
ylabel('e');
title('Task 3');
xscale("log");
yscale("log");


legend('show');

grid on;


function e = get_e(y_values, yp_values)
    e = sum(yp_values - y_values);
end