function phi = get_phi(x_values, k)
    phi = zeros(length(x_values), k+1);
    
    for i = 1:length(x_values)
        for j = 1:k+1
            phi(i, j) = x_values(i)^(j-1);
        end
    end
end