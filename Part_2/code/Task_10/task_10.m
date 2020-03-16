%% Task 10

%% Subtask_1

% Initialization
clear;
depth = 9;
lambda = .1;
sigma_1 = 20;
sigma_noise = 1;
T = 1;
is_print = true; 

% Carry out

[t_vec, sgn_vec] = orn_uhl_mod(depth, lambda, sigma_1, T);
n = numel(t_vec);
unflt_sgn =  sgn_vec +  normrnd(0, sigma_noise, n, 1);

[t_vec, est_vec, conf_int_mat] =  kalmat_filter(t_vec, unflt_sgn, sigma_1, sigma_noise, lambda);

% Visualisation
if is_print
    kalman_vis(t_vec, unflt_sgn, est_vec, conf_int_mat, 'norm', sigma_1, lambda, sigma_noise);
end


%% Subtask_2

% Initialization
clear;
depth = 8;
lambda = 0.1;
sigma_1 = 5;
gamma = 3;
sigma_noise = gamma;
T = 1;
is_print = true; 

% Carry out

[t_vec, sgn_vec] = orn_uhl_mod(depth, lambda, sigma_1, T);
n = numel(t_vec);
unflt_sgn =  sgn_vec +  cauchy_rnd(0, gamma, n);

[t_vec, est_vec, conf_int_mat] =  kalmat_filter(t_vec, unflt_sgn, sigma_1, sigma_noise, gamma);

% Visualisation
if is_print
   kalman_vis(t_vec, unflt_sgn, est_vec, conf_int_mat, 'cauchy', sigma_1, lambda, gamma);
end




