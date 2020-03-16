%% Task 7

%% Subtask_1

% Initialization
clear;

power = 5;
n = 10^power;
n_tests = 5;
r_vec = zeros(n,1);     phi_vec = zeros(n,1);
data_mat = zeros(4,1);
sum_min = 0;    sum_t = 0; 
gamma = 0.99;   eps_const = 45;         % see report
do_tests = false;

% Carry out

if do_tests
    ind = n_tests;
    while ind > 0
        tic();
        r_vec = sqrt(rand(n,1));
        phi_vec = 2*pi*rand(n,1);
        x_1_vec = r_vec .* cos(phi_vec);
        x_2_vec = r_vec .* sin(phi_vec);
        f_vec = x_1_vec.^3 .* sin(1./x_1_vec) + 10 * x_1_vec .* x_2_vec .^4 .* cos(1./x_2_vec); 
        f_vec(isnan(f_vec)) = 0;
        sum_min = sum_min + min(f_vec);
        sum_t = sum_t + toc();
        ind = ind - 1;
    end
    data_mat(1) = power; data_mat(2) = sum_t / n_tests ;
    data_mat(3) = sum_min / n_tests; data_mat(4) = eps_const * sqrt(gamma/n);
else
    tic();
    r_vec = sqrt(rand(n,1));  phi_vec = 2*pi*rand(n,1);
    x_1_vec = r_vec .* cos(phi_vec); x_2_vec = r_vec .* sin(phi_vec);
    f_vec = x_1_vec.^3 .* sin(1./x_1_vec) + 10 * x_1_vec .* x_2_vec.^4 .* cos(1./x_2_vec); 
    f_vec(isnan(f_vec)) = 0; 
    disp(['min = ', num2str(min(f_vec))]); disp(['eps = ',num2str(eps_const * sqrt(gamma/n))]); 
    disp(['time = ',num2str(toc())])
end

% Visualisation
if do_tests
    name = strcat('tables\rs_vec_for_', num2str(power),'.mat');
    save(name, 'data_mat', '-mat');        
    disp('end');
end


%% Subtask_2

% Initialization
clear;
T_0 = 100;   
k = 0.59;       
sigma = 10;    
iter_max = 10^5; 
x_0 = sigma * rand(2,1);
data_mat = zeros(3,2);
n_tests = 20;
ros_func = @(x_vec) (x_vec(1) - 1)^2 + 100 * (x_vec(2) - x_vec(1)^2)^2;
options = optimset('MaxIter', iter_max);
do_tests = true; 

% Carry out

if do_tests
    ind = n_tests;
    sum_min_as = 0; sum_t_as = 0;
    sum_min_fms = 0; sum_t_fms = 0;
    while ind > 0
        tic();
        min_as = aneal_sim(ros_func, x_0, T_0, k ,sigma, iter_max);
        sum_min_as = sum_min_as + min_as;
        sum_t_as = sum_t_as + toc();
        tic();
        fms_min = ros_func(fminsearch(ros_func, x_0, options));
        sum_min_fms = sum_min_fms + fms_min;
        sum_t_fms = sum_t_fms + toc();
        ind = ind - 1;
    end
    data_mat(1) = n_tests; 
    data_mat(2,1) = sum_min_as / n_tests;  data_mat(2,2) = sum_t_as / n_tests ; 
    data_mat(3,1) = sum_min_fms / n_tests; data_mat(3,2) = sum_t_fms / n_tests ;
else
    disp(['x_0 = ',num2str(x_0')]);
    tic();
    min_as = aneal_sim(ros_func, x_0, T_0, k ,sigma, iter_max);
    disp(['min_as = ', num2str(min_as)]); disp(['time_as = ',num2str(toc())]);
    tic();
    fms_min =  ros_func(fminsearch(ros_func, x_0, options));
    disp(['min_fms = ', num2str(fms_min)]); disp(['time_fms = ',num2str(toc())]);
    disp(' ');
end

% Visualisation
if do_tests
    name = strcat('tables\as_vec_for_', num2str(iter_max),'.mat');
    save(name, 'data_mat', '-mat');        
    disp('end');
end



