function [t_vec, orn_uhl_vec] = orn_uhl_mod(depth, lambda, sigma, T)
    
    % let EX(t) = 0 
    
    n = 2^depth+1;
    
    t_vec = zeros(n,1);
    t_vec(end) = T;
    orn_uhl_vec = zeros(n,1);
    orn_uhl_vec(1) = normrnd(0, sigma);
    orn_uhl_vec(end) = normrnd( orn_uhl_vec(1) * exp(-lambda * T), sigma * sqrt(1 - exp(-2 * lambda * T)));
    exist_vec = zeros(1,n);
    exist_vec([1,n]) = 1;
    
    for ind = 1:depth
        cur_pairs_vec = find(exist_vec);
        l_ind_vec = cur_pairs_vec(1:end-1);
        r_ind_vec = cur_pairs_vec(2:end);
        o_u_l_vec = orn_uhl_vec(l_ind_vec);      o_u_r_vec = orn_uhl_vec(r_ind_vec);
        t_l_vec = t_vec(l_ind_vec);                     t_r_vec = t_vec(r_ind_vec);
        cur_pos_vec = fix((l_ind_vec + r_ind_vec)/2);
        t_vec(cur_pos_vec) = (t_l_vec + t_r_vec) / 2;
        orn_uhl_vec(cur_pos_vec) = normrnd(  ...
             (o_u_l_vec + o_u_r_vec) .* exp(-lambda*(t_r_vec - t_l_vec)/2) ./...
                                                            ( 1 + exp(-lambda*(t_r_vec-t_l_vec))), ...
                                       sigma * sqrt( (1 - exp(-lambda*(t_r_vec - t_l_vec))) ./ ...
                                                           (1 + exp(-lambda*(t_r_vec - t_l_vec))))); 
        exist_vec(cur_pos_vec) = 1;
    end
    
end