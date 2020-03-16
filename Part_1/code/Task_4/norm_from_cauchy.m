function x_cauchy = norm_from_cauchy(n_rv)
    
    x_0 = 0;
    gamma = 1;
    k = sqrt(2 * pi / exp(1));
    
    n_rv_left= n_rv;
    n_rv_got = 0;
    
    x_cauchy = zeros(n_rv,1);
    sample_size = min(1000, n_rv);
    
    while n_rv_left > 0
        cauchy_vec = cauchy_rnd(x_0, gamma, sample_size);
        bern_tr_vec = rand(sample_size,1) < (sqrt( pi/2 ) * exp( -cauchy_vec.^2 ) .* (cauchy_vec.^2 +1) / k);
        ind_norm = find(bern_tr_vec);
        n_new_rv = numel(ind_norm); 
        if n_new_rv > 0
            right_edge = (n_rv_got + min( n_new_rv, n_rv_left ) ) ;
            x_cauchy((n_rv_got + 1) : right_edge ) = cauchy_vec(ind_norm(1:min(n_new_rv, n_rv_left)));
            n_rv_got = n_rv_got + n_new_rv;  
            n_rv_left = n_rv_left - n_new_rv;
        end       
    end
   
end