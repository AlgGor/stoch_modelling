%% Task 9

%% Subtask_1

% Initialization
clear;
depth = 15;
alpha = 0.3;
is_print = true; 

% Carry out

[t_vec, w_vec] = wiener_mod(depth, alpha);


% Visualisation
if is_print
     wiener_vis(t_vec, w_vec, alpha, depth);    
end


%% Subtask_2

% Initialization
clear;
depth = 12;
lambda = 30;
sigma = 20;
T = 10;
is_print = true; 

% Carry out

[t_vec, orn_uhl_vec] = orn_uhl_mod(depth, lambda, sigma, T);

% Visualisation
if is_print
     orn_uhl_vis(t_vec, orn_uhl_vec, lambda, sigma, depth);    
end




