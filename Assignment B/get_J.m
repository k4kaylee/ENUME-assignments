function J = get_J(k_values, xmax_values, N)
    for n = 1:N
        for i = 1:length(k_values)
            for j = 1:length(xmax_values)
                k = k_values(i);
                xmax = xmax_values(j);
                x_vec = transpose(linspace(-xmax, xmax, 100));
                
                phi = get_phi(x_vec, k);
        
                y = f27(x_vec);
                p = phi \ y;
        
                y_approx = phi * p;
                Jn = get_jn(y_approx, y);
        
                J = sum(Jn);
                %disp([n, "K", k, "Max X", xmax, "J", J]);
            end
        end
    end
end

function Jn = get_jn(y_approx, y)
    Jn = (y_approx - y).^2;
end
