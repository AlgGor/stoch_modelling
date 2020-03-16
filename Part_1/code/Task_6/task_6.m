%% Task 6

%% Subtask_1

% Initialization
clear;

power = 8;
n = 10^power;
n_tests = 5;
sum_t = 0; 
data_mat = zeros(n_tests + 1,2);
do_tests = true;

% Carry out
if do_tests
    while n_tests > 0
        tic();
        [int_val, my_eps] = monte_carlo(n);
        data_mat(n_tests + 1, 1) = int_val;
        data_mat(n_tests + 1, 2) = my_eps/int_val;   % equals percent/100
        sum_t = sum_t + toc();
        n_tests = n_tests - 1;
    end
    data_mat(1,1) = power; data_mat(1,2) = sum_t / (size(data_mat,1) - 1);
else
    tic();
    [int_val, my_eps] = monte_carlo(n);
    disp(['int_val = ',num2str(int_val)]);
    disp(['eps = ',num2str(my_eps)]);
    disp(['time = ',num2str(toc())]);
end


% Visualisation
if do_tests
    name = strcat('tables\mc_mat_for_', num2str(power),'.mat');
    save(name, 'data_mat', '-mat');        
    disp('end');
end


%% Subtask_2

% Initialization
clear;

n = 60;  % along [-1,1], x_i = tg(\pi t_i/2)
n_tests = 5;
data_mat = zeros(n_tests + 2,1);
sum_t = 0; 
do_tests = false;

% Carry out

if do_tests 
    while n_tests > 0
        tic();
        int_val= quadr(n);
        data_mat(n_tests + 2, 1) = int_val;
        sum_t = sum_t+ toc();
        n_tests = n_tests - 1;
    end
    data_mat(1) = n;
    data_mat(2) = sum_t / 10;
else
    tic();
    int_val = quadr(n);
    disp(['int_val = ',num2str(int_val)]);
    disp(['time = ',num2str(toc())]);
    % N = 32 int_val = 124.8081 time = 13.6501
    % N = 40 int_val = 124.8003 time = 83.5463
    % N = 50 int_val = 124.8052 time = 543.2347
    % N = 60 int_val = 124.812  time = 2675.4143
end


% Visualisation
if do_tests 
    name = strcat('tables\quadr_mat_for_', num2str(power),'.mat');
    save(name, 'data_mat', '-mat');        
    disp('end');
end






