function [value, my_eps]= monte_carlo(n)
    
    ind = ceil(n/10^7);
    quant = min(10^7, n); 
    value = 0;
    expt_x_pow_2 = 0;
    gamma = 0.99;
    quantile = norminv((1+gamma)/2);
   
    while ind > 0
        x_mat = normrnd(0, sqrt(1/2), quant, 10);   %% normrnd(mu, SIGMA) not var
        prod_x_vec = prod(x_mat, 2).^2;
        f_vec = exp(-1 ./ (2^7 * prod_x_vec)) ./ (prod_x_vec);
        value = value  + 1/n * pi^5 * sum(f_vec);
        expt_x_pow_2 = expt_x_pow_2 +  1/n * pi^10 * sum(f_vec.^2);
        ind = ind - 1;
    end
    
    sigma = sqrt(expt_x_pow_2 - value^2);
    my_eps = quantile *  sigma / sqrt(n);
      
end