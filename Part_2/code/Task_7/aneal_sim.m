function global_min = aneal_sim(ros_func, x_0, T_0, k ,sigma, n_max)

    neighbour_i = @(cur_pos, t_cur)  normrnd(cur_pos, sigma * sqrt(t_cur));
    t_i = @(t_prev)  t_prev*k;
    p_i = @(new_val, cur_val, t_cur) exp( - (new_val - cur_val) /t_cur); 
    
    as_min = ros_func(x_0);
    cur_pos = x_0;
    cur_value = ros_func(x_0);
    t_cur = T_0;
    ind = n_max;
    
    while  ind > 0
        if  cur_value < as_min
            as_min = cur_value;       
        end
        t_cur = t_i(t_cur); 
        new_pos = neighbour_i (cur_pos, t_cur);
        new_value = ros_func(new_pos);
        cur_p = p_i(new_value, cur_value, t_cur);
        alpha = rand();
        while alpha >= cur_p
             new_pos = neighbour_i(cur_pos, t_cur);
             new_value = ros_func(new_pos);
             cur_p = p_i(new_value, cur_value, t_cur);
             alpha = rand();
        end
        cur_pos = new_pos;
        cur_value = ros_func(cur_pos);
        ind = ind - 1;
    end  
    
    global_min = as_min;
    
end

