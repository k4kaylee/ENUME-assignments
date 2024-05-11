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
    J = get_J(k, Xmax, N);
    e = sqrt(J / N);
    e_values(i, j) = e;
  end
end

% Plotting e_values with respect to Xmax_values
figure(1);
hold on;

for j = 1:Knum
  plot(Xmax_values, e_values(:, j));
end

xlabel('Xmax');
ylabel('Error (e)');
legend_info = cell(Knum, 1);
for j = 1:Knum
  legend_info{j} = sprintf('k = %d', K_values(j));
end
legend(legend_info);
yscale("log");
