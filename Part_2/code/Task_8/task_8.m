%% Task 8

%% Subtask_1

% Initialization
clear;
N = 40;             % spots in [-1,1]
n_hit = 100;    %  process visited each spot at least n_hit times
n = fix(N/2)*2 + 1; 
is_print = true; 

% Carry out

[edge_temp_mat, edge_vec, inside_vec]= init_cond_and_edge(n);

solution_mat = mc_laplace(edge_temp_mat, edge_vec, inside_vec, n_hit);

% Visualisation
if is_print
    mc_vis(solution_mat,n_hit);
end