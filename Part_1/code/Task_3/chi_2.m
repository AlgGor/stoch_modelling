function value = chi_2(x, lambda)

    n_rv = numel(x);
    N = max(x);
    ind_vec = 1:N;
    edges = [0, ind_vec, N+1] - 0.5;
    freq_i = histcounts(x, edges) / n_rv;
    p_i_0 =[exp( -lambda), lambda .^ ind_vec * exp( -lambda) ./ cumprod(ind_vec)];
    value = n_rv * sum((freq_i - p_i_0) .^2 ./ p_i_0);
    
end