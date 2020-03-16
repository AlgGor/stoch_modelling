function int_val = quadr(N)

    n_pos = fix(N/2);
      
    % On my computer exp(-800) = 0 ( exp(-800) > 0 = 0 ), so I desided to reduce circles with
    % zero int_val. If there are number(x_i = 1) = n_ones, then exp(...)
    % will be 0
    lim_accuracy = 800; 
    stp_sz =  pi/2/n_pos;
    lambda_vec = fliplr( tan(stp_sz * (n_pos - 1/2)) .^ [0:9] );
    % I can explain next line, it is non obvious
    crit_val_tan = (1/sqrt(lim_accuracy*128) ./ lambda_vec) .^ (1 ./ [1:10]);
    crit_ind_vec = fix(atan(crit_val_tan) / stp_sz) + 1;
   
    x_vec =  zeros(1, 10);
    repeats_vec = zeros(1, n_pos);
    
    int_val = 0;
    cur_val = 0;
  	ten_factorial = factorial(10);
    pos_neg_sim = 2^10;
    step_vol = (1/n_pos)^10;
    
    pi_2_10 = (pi/2)^10;
    exp_power = 0;
    
    for i_1 = 1:n_pos
        repeats_vec(i_1) = repeats_vec(i_1) + 1;  x_vec(1) = i_1;
        for i_2 = i_1:n_pos
            repeats_vec(i_2) = repeats_vec(i_2) + 1; x_vec(2) = i_2;
            for i_3 = i_2:n_pos
                repeats_vec(i_3) = repeats_vec(i_3) + 1;  x_vec(3) = i_3;
                for i_4 = i_3:n_pos
                    repeats_vec(i_4) = repeats_vec(i_4) + 1;  x_vec(4) = i_4;
                    for i_5 = i_4:n_pos
                       repeats_vec(i_5) = repeats_vec(i_5) + 1;  x_vec(5) = i_5; 
                        for i_6 = max(crit_ind_vec(6),i_5):n_pos
                            repeats_vec(i_6) = repeats_vec(i_6) + 1; x_vec(6) = i_6;
                            for i_7 = max(crit_ind_vec(7),i_6):n_pos
                                repeats_vec(i_7) = repeats_vec(i_7) + 1; x_vec(7) = i_7;
                                for i_8 =max(crit_ind_vec(8), i_7):n_pos
                                    repeats_vec(i_8) = repeats_vec(i_8) + 1; x_vec(8) = i_8;
                                    for i_9 = max(crit_ind_vec(9),i_8):n_pos  
                                        repeats_vec(i_9) = repeats_vec(i_9) + 1; x_vec(9) = i_9;
                                        for i_10 =max(crit_ind_vec(10), i_9):n_pos
                                            repeats_vec(i_10) = repeats_vec(i_10) + 1; x_vec(10) = i_10;
                                            cur_reps = ten_factorial / prod(factorial(repeats_vec)) * pos_neg_sim;
                                            tan_2_vec = tan(stp_sz * (x_vec -1/2)).^2;              % (n_pos+1) made to prevent tan(pi/2)
                                            exp_power = sum(tan_2_vec) + 1/(128 * prod(tan_2_vec));
                                            cur_val = exp(- exp_power ) / ( prod(tan_2_vec) * prod(cos(stp_sz * (x_vec -1/2)).^2) );
                                            int_val = int_val + pi_2_10 * step_vol * cur_reps * cur_val;
                                            repeats_vec(i_10) = repeats_vec(i_10) - 1;
                                        end
                                        repeats_vec(i_9) = repeats_vec(i_9) - 1;
                                    end
                                    repeats_vec(i_8) = repeats_vec(i_8) - 1;
                                end
                                repeats_vec(i_7) = repeats_vec(i_7) - 1;
                            end
                            repeats_vec(i_6) = repeats_vec(i_6) - 1;
                        end
                        repeats_vec(i_5) = repeats_vec(i_5) - 1;
                    end
                    repeats_vec(i_4) = repeats_vec(i_4) - 1;
                end
                repeats_vec(i_3) = repeats_vec(i_3) - 1;
            end
            repeats_vec(i_2) = repeats_vec(i_2) - 1;
        end
        repeats_vec(i_1) = repeats_vec(i_1) - 1;
    end
   
end
    
   
