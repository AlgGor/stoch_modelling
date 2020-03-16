function [t_vec, nonhom_pois_vec] = nonhom_pois_mod(lambda_0, T)

    lambda_star = 2 * lambda_0; 
    rate_func = @(t_vec) lambda_0 * (1 + cos(t_vec));

    n_expt = ceil(T / lambda_star);
    t_star_vec = cumsum(exprnd(1/lambda_star, n_expt, 1));   
    n = find(t_star_vec > T, 1);
    while isempty(n)
        n_expt = ceil((T - t_star_vec(end)) / lambda_star);
        tmp_vec = t_star_vec(end) + cumsum(exprnd(1/lambda_star, n_expt, 1));
        t_star_vec = cat(1, t_star_vec, tmp_vec);
        n = find(t_star_vec > T, 1);
    end
    n = n - 1;
    t_star_vec = t_star_vec(1:n);

    t_vec = t_star_vec(rand(n,1) <= (rate_func(t_star_vec) / lambda_star));
    nonhom_pois_vec = [0:numel(t_vec),numel(t_vec)]';
    t_vec = [0; t_vec; T];
    
end