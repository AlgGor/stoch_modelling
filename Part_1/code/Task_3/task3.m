%% Task 3

%% Subtask_1

% Initialization

clear;
n = 10^6;
n1 = 100;

m = 10^5;
is_print = true;
lambda = 1.5;
lambda_vec= 2 * rand(1, n1);

% Carry out

x = exp_rnd(lambda, n);

% Visualisation
if is_print
    %exp_vis(lambda, n);
    %mmls_prop(lambda, n);
    pdf_min_exp(lambda_vec, m, n1);
end



%% Subtask_2

% Initialization

clear;
n = 10^5;
lambda = 10;
is_print = true; 

% Carry out

x = pois_rnd(lambda,n);

% Visualisation
if is_print
    pois_vis(lambda, n);
end


%% Subtask_3

% Initialization

clear;
lambda = 2;

% n_rv = 10000;
% n_tr = 10^6;
% It takes a lot of time to process but as you can see it works with 10^10 bern trials
% Binomrnd is recreated to process huge number of random variables
alpha = 0.05;
% With these inputs program works much faster wo step change.  
% 10^8 bern trials over all - rand
n_rv = 10^4;
n_tr = 10^2;
is_print = true;

% Carry out

x = binomrnd(lambda/n_tr, n_tr, n_rv);
%disp("x is created");       % added to check computer's frozing because of huge x
chi_2_emp = chi_2(x, lambda);
chi_2_crit = chi2inv(1 - alpha, max(x)-1);
disp(["chi_crit: ", num2str(chi_2_crit)]);
disp(["chi_emp: ", num2str(chi_2_emp)]);

if ( chi_2_crit < chi_2_emp)
    disp('It is not Poisson distribution!');
else
    disp('It is Poisson distribution!');
end

% Visualisation
if is_print
    pois_lim_bin_vis(x, lambda, n_tr);
end

%% Subtask_4

% Initialization

clear;
n = 10^5;
alpha = 0.05;
p_sum_1 = 0;
p_sum_2 = 0;
n_tests = 10^4;
is_print = false; 

% Carry out

for ind =1:n_tests
    
    omega_vec = exp_rnd(0.5, n);
    phi_vec = rand(n,1) * 2*pi;
    ksi_vec = omega_vec.^(1/2) .* cos(phi_vec);
    nu_vec = omega_vec.^(1/2) .* sin(phi_vec);

    N_1 = numel(ksi_vec); 
    t_emp= stud_test(ksi_vec); 
    t_crit = tinv( 1 - alpha/2, N_1 - 1); 

    p_sum_1 = p_sum_1 +  (t_crit >= abs(t_emp));
    %isp(["t_emp: ", num2str(t_emp)]);
    % disp(["t_crit: ", num2str(t_crit)]);
    % if (t_crit < abs(t_emp))
    %     disp('t_test: It is not normal distribution!');
    % else
    %     disp('t_test: It is normal distribution!');
    % end


    N_2 = numel(ksi_vec);
    f_emp = f_test(ksi_vec, nu_vec);
    f_left = finv(alpha/2, N_2 - 1, N_2 - 1);
    %disp(["f_emp: ", f_emp]);
    %disp(["f_interv = [", f_left, 1/f_left,"]"]);
    p_sum_2 = p_sum_2 + ((f_emp > f_left) && (f_emp < 1/f_left));

    % if ( (f_emp < f_left) || (f_emp > 1/f_left) )
    %     disp('f_test: It is not normal distribution!');
    % else
    %     disp('f_test: It is normal distribution!');
    % end
    
end

% Visualisation
if is_print
    norm_polar_vis(ksi_vec, 'ksi');
    norm_polar_vis(nu_vec, 'nu');
end








