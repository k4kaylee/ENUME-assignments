function e = get_e(y_values, yp_values)
    e = sum(abs(yp_values - y_values))/length(y_values);
end