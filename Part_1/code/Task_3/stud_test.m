function t_value = stud_test(x_vec)
    
    mu = 0;
    N = numel(x_vec);
    emp_mu = sum(x_vec) / N;
    s_x = sum( (x_vec - emp_mu).^2 ) / (N - 1);
    
    t_value = (emp_mu - mu) / (s_x / sqrt(N) );
    
 end