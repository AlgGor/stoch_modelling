%% Task 4

%% Subtask_1

% Initialization

clear;
n = 10^6;
x_0 = 0;
gamma = 1;
is_print = true; 

% Carry out

x_vec = cauchy_rnd(x_0, gamma, n);

% Visualisation
if is_print
    cauchy_vis(x_0, gamma, n);
end



%% Subtask_2

% Initialization

clear;
n = 10^3;
mu = 10;
sigma = 4;
is_print = true;

% Carry out

x_vec = norm_from_cauchy(n);

% Visualisation
if is_print
    %norm_cauchy_vis(x_vec);
    norm_cauchy_vis(x_vec, mu+ sigma*x_vec);
end


%% Subtask_3

% Initialization

clear;
is_print = false;
pow = 1; 
n_pows_to_compare = 4;
pow_step = 2;
n_tests = 10;
t_polar = zeros(n_pows_to_compare, 1); 
t_neumann = zeros(n_pows_to_compare, 1);

while n_pows_to_compare > 0
    while n_tests > 0 
        tic;
        norm_from_cauchy(10^pow);
        t_neumann(n_pows_to_compare) = t_neumann(n_pows_to_compare)+  toc; 
        tic;
        norm_from_polar(10^pow);
        t_polar(n_pows_to_compare) = t_polar(n_pows_to_compare) + toc; 
        n_tests = n_tests - 1;
    end
    n_tests = 20;
    pow = pow + pow_step;  
    n_pows_to_compare = n_pows_to_compare - 1;
end

t_neumann = flipud(t_neumann / n_tests);
t_polar= flipud(t_polar / n_tests);

T = table(t_neumann, t_polar);
T.Properties.RowNames = {'10','10^3','10^5', '10^7'}; 
T.Properties.VariableNames = {'Neumann', 'Polar'};
disp(T);






