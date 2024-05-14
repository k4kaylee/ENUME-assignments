function J = get_J(k_values, xmax_values, N)
    J = zeros(length(k_values), length(xmax_values));
    for i = 1:length(k_values)
        for j = 1:length(xmax_values)
            k = k_values(i);
            xmax = xmax_values(j);
            x_values = transpose(linspace(-xmax, xmax, N));
            
            phi = get_phi(x_values, k);
    
            y = f27(x_values);
            p = phi \ y;
    
            y_approx = phi * p;

            J(i, j) = sum((y_approx - y) .^ 2);
        end
    end
end
