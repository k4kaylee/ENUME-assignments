function phi = get_phi(x_vec, k)
    phi = zeros(length(x_vec), k+1);
    
    for i = 1:length(x_vec)
        for j = 1:k+1
            phi(i, j) = x_vec(i)^(j-1);
            %fprintf('%d ', phi(i, j)); % for test purpose
        end
        %fprintf('\n'); % for test purpose
    end
end