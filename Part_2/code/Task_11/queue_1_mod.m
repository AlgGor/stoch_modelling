function [t_vec, n_vec] = queue_1_mod(lambda, T)

    dgr_frd = 10;
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

    s_vec = chi2rnd(dgr_frd, n , 1);
    s_vec([1, end]) = 0;
    q_vec = zeros(n, 1);
    n_vec = zeros(n,1);
    ind_finished = 1;

    for ind = 2:n
        t_cur = t_vec(ind);
        q_vec(ind) = max(q_vec(ind-1), t_cur) + s_vec(ind) ;
        while  q_vec(ind_finished) <= t_cur
            ind_finished = ind_finished + 1;
        end
        n_vec(ind) = ind - ind_finished;
    end

end