%% Task 5

%% Subtask_1

% Initialization

clear;
n_rv = 10^3;
ind_vec = (1:n_rv)';
n_tests = 10^5;
is_print = true; 
mu = 1;
var = 2;

% Carry out

x_mat = norm_from_polar(mu, var, n_rv);
lln_vec = cumsum(x_mat) ./ ind_vec;
x_mat = norm_from_polar(mu, var, n_rv, n_tests);
clt_vec = sqrt(n_rv) * (sum(x_mat, 1) / n_rv - mu);

% Visualisation
if is_print
    LLN(lln_vec);
    CLT(clt_vec, var);
end



%% Subtask_2

% Initialization

clear;
pow = 7;
n_rv = 10^pow;
sample_size = reshape([0.5; 1] .* 10 .^ (1 : (pow - 1)), [], 1);

alpha = 0.05;
mu = 2;
var = 4;
is_print = true; 

% Carry out

x_mat = norm_from_polar(mu, var, n_rv);
x_sum_vec = cumsum(x_mat);
x_average = x_sum_vec(sample_size) ./ sample_size;
s_2_func = @(n) 1/(n-1)  * sum((x_mat(1:n) - x_average(sample_size==n)).^2);
s_2_vec = arrayfun(s_2_func, sample_size); 

t_stud_vec = tinv(1 - alpha/2, sample_size -1); 
conf_int_mu = x_average + [-1,1] .* (t_stud_vec .* sqrt(s_2_vec ./ sample_size));
x_2_mat= cat(2, chi2inv(1- alpha/2, sample_size - 1), chi2inv(alpha/2, sample_size - 1 ));
conf_int_var = (sample_size - 1) .* s_2_vec ./ x_2_mat; 

% Visualisation
if is_print
    mu_vis(sample_size, x_average, conf_int_mu);
    var_vis(sample_size, s_2_vec, conf_int_var);
end

%% Subtask_3

% Initialization

clear;
n_rv = 10^4;
n_tests = 10^4;
ind_vec = (1:n_rv)';
is_print = true; 
a = 0;
b = 1;

% Carry out

x_mat = cauchy_rnd(a, b, n_rv, n_tests);
lln_vec = cumsum(x_mat(:,1)) ./ ind_vec;
sum_vec = sum(x_mat,1)/ n_rv;

% Visualisation
if is_print
    %LLN_cauchy(lln_vec);
    cauchy_sum_vis(sum_vec, a, b);
end





