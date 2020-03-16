function [t_vec, w_vec] = wiener_mod(depth, alpha)


    n = 2^depth+1;
    
    t_vec = zeros(n,1);
    t_vec(end) = 1;
    w_vec = zeros(n,1);
    w_vec(end) = normrnd(0,1);
    exist_vec = zeros(1,n);
    exist_vec([1,n]) = 1;
    
    for ind = 1:depth
        cur_pairs_vec = find(exist_vec);
        l_ind_vec = cur_pairs_vec(1:end-1);
        r_ind_vec = cur_pairs_vec(2:end);
        w_l_vec = w_vec(l_ind_vec);     w_r_vec = w_vec(r_ind_vec);
        t_l_vec = t_vec(l_ind_vec);      t_r_vec = t_vec(r_ind_vec);
        cur_pos_vec = fix((l_ind_vec + r_ind_vec)/2);
        t_vec(cur_pos_vec) = (1 - alpha) * t_l_vec + alpha * t_r_vec;
        w_vec(cur_pos_vec) = normrnd((1 - alpha) * w_l_vec + alpha * w_r_vec, ...
                                                sqrt( alpha * (1 - alpha) * (t_r_vec - t_l_vec))); 
        exist_vec(cur_pos_vec) = 1;
    end
    
end