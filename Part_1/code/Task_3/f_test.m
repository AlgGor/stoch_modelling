function f_value = f_test(x_vec, y_vec)

    N = numel(x_vec);
    emp_mu = sum(x_vec) / N;
    var_1 = sum((x_vec - emp_mu).^2) / N;
    N = numel(y_vec);
    emp_nu = sum(y_vec) / N;
    var_2 = sum((y_vec - emp_nu).^2) / N;
    f_value = var_1 / var_2;
    
end