clc, clearvars, close all

N = 100;
Knum = 12;
Xnum = 100;
Xmax_values = linspace(0.5, 2.5, Xnum);
K_values = round(linspace(4, 16, Knum));
e_values = zeros(Xnum, Knum);

for i = 1:length(Xmax_values)
  Xmax = Xmax_values(i);
  for j = 1:Knum
    k = K_values(j);
    x_vec = linspace(-Xmax, Xmax, Xnum);
    J = sum(get_J(k, Xmax, N));
    e = sqrt(J / N);
    e_values(i, j) = e;
  end
end

% Plotting
figure(1);
hold on;

set(gca, 'FontSize', 18);

for j = 1:Knum
  plot(Xmax_values, e_values(:, j), 'LineWidth', 1.5);
end

title('Task 2', 'Interpreter', 'latex', 'FontSize', 30);
xlabel('Xmax', 'Interpreter', 'latex', 'FontSize', 30);
ylabel('Error (e)', 'Interpreter', 'latex', 'FontSize', 30);
legend_info = cell(Knum, 1);
for j = 1:Knum
  legend_info{j} = sprintf('K = %d', K_values(j));
end
legend(legend_info, 'Location', 'SouthEast');
yscale("log");

grid on;

set(gcf, 'Position', [0 0 1600 900]);
saveas(gcf, 'task2.jpg');
