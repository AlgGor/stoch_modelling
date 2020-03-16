%% Task 11

%% Subtask_1

% Initialization
clear;
lambda = 0.15;
T = 5000;
type = 'hom';
is_print = true; 

% Carry out 
[t_vec, n_vec] = queue_1_mod(lambda, T);

% Visualisation
if is_print
    queue_vis(t_vec, n_vec, lambda ,type);
end


%% Subtask_2

% Initialization
clear;
lambda_0 = 15;
type = 'nonhom';
T = 100;
is_print = true; 

% Carry out

[t_vec, nonhom_pois_vec] = nonhom_pois_mod(lambda_0, T);

% Visualisation
if is_print
    queue_vis(t_vec, nonhom_pois_vec, lambda_0, type);
end

%% Subtask_3

% Initialization
clear;
lambda = 0.1; 
w_0 = 100;
c = 0.13;
x_m = 1;
k = 3;
T = 5000;
is_print = true; 

% Carry out

[t_vec, w_vec, flag] = ins_mod(w_0, c, lambda, x_m, k, T);

% Visualisation
if is_print
     ins_vis(t_vec, w_vec, lambda, w_0, c, k)
end



