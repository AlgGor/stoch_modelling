function x = pois_rnd(lambda, n)
    
    n_rv_got =  0;
    n_failed_spl = 0;
    cur_sum = 0;
    prev_sum = 0;
    
    x = zeros(n, 1);
    
    while n_rv_got < n
        sample_size = ceil(lambda);
        exp_vec= exp_rnd(lambda, sample_size); 
        % EX= 1 / lambda_i , so i expect ceil(lambda) would be enough
        cur_sum = prev_sum + sum(exp_vec);
        if cur_sum > 1
            n_rv_got = n_rv_got + 1;
            x(n_rv_got) = n_failed_spl * sample_size + find(cumsum(exp_vec) > (1 - prev_sum), 1) - 1;
            n_failed_spl = 0;
            prev_sum = 0;
        else
            n_failed_spl = n_failed_spl + 1;
            prev_sum = cur_sum;
        end
        
    end
        
end