function [t_vec, x_est_vec, conf_int_mat] = kalmat_filter(t_vec, unflt_sgn, sigma_1, sigma_2, lambda)
   
    n = numel(t_vec);
    alpha = 0.95; quantile = norminv((1+alpha)/2);
    x_cur = 0;                            % init = x_{0|-1} 
    x_est_vec = zeros(n,1);         % x_{k|k}_vec
    r_est = sigma_1^2;              % init = r_{0|-1}    
    conf_int_mat = zeros(n,2);
    a_vec =  [exp(-lambda  * diff(t_vec)); 0];
   
    k = 1;
    while k < (n + 1)
        sgn_inv = r_est / (r_est + sigma_2^2);
        x_cur = (1 - sgn_inv) * x_cur + sgn_inv * unflt_sgn(k);         % x_{k|k}
        x_est_vec(k) = x_cur;
        r_est = (1 - sgn_inv) * r_est;                                                % r_{k|k}
        conf_int_mat(k,:) = x_cur + quantile * r_est * [-1, 1];   
        x_cur = a_vec(k) * x_cur;                                                     %x_{k+1|k}
        r_est = a_vec(k)^2 * r_est + sigma_1^2 * (1 - a_vec(k)^2);  % r_{k+1|k}
        k = k + 1;
    end
    
    
    
end