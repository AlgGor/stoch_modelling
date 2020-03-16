function [t_vec, w_vec, flag] = ins_mod(w_0, c, lambda, x_m, k, T)

    n_expt = ceil(T / lambda);
    t_vec = cumsum(exprnd(1/lambda, n_expt, 1));   
    n = find(t_vec > T, 1);
    while isempty(n)
        n_expt = ceil((T - t_vec(end)) / lambda);
        tmp_vec = t_vec(end) + cumsum(exprnd(1/lambda, n_expt, 1));
        t_vec = cat(1, t_vec, tmp_vec);
        n = find(t_vec > T, 1);
    end
    t_vec = [0; t_vec(1:(n-1)); T];
    n = n + 1;

    s_t_vec = cumsum(pareto_rnd(x_m, k, n));
    s_t_vec(1) = 0; s_t_vec(end) = s_t_vec(end - 1);
    flag = sign(c - k * x_m / (lambda * (k - 1)));
    w_vec = w_0 + c * t_vec - s_t_vec;
    n = find(w_vec < 0, 1);
    w_vec(n:end) = 0;
    
end