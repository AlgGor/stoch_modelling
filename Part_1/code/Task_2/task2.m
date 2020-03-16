%% Task 2

%% Subtask_1

% Initialization
clear;
n = 10^6;
alpha = 0.05;
p_sum = 0;
is_print = true;

% Carry out

[x, cant_cdf] = cantrnd(n);
p_value = kolm_test(x, cant_cdf);

disp(['p_value is: ', num2str(p_value)]);

if p_value > alpha
    disp('Sensor generates a singular distribution');
else
    disp('Sensor doesn`t generate a singular distribution');
end

% Visualisation
if is_print
    cant_vis(n);
end



%% Subtask_2

% Initialization
clear;
n = 10^5;
alpha = 0.05;
n_tests = 10^3;
p_sum_1 = 0;
p_sum_2 = 0;
is_print = false; 

% Carry out

[x,~] = cantrnd(n);

k = size(x,1);
one_minus_x = 1 - x;
m = size(one_minus_x,1);
D_n_m = smir_test(x, one_minus_x);
p_value =  1 - kolmcdf(D_n_m*sqrt(k * m / (m + k)));

%p_sum_1 = p_sum_1 + (p_value > alpha);
disp('X and 1-X symmetry: ');
disp(['p_value is: ', num2str(p_value)]);
disp_same_distr(p_value, alpha);

k = size(x(x <= 1/3), 1); 
x_div_3 = x / 3;
m = size(x_div_3, 1);
D_n_m = smir_test(x(x <= 1/3), x_div_3);
p_value =  1 - kolmcdf(D_n_m*sqrt(k * m / (m + k)));
%p_sum_2 = p_sum_2 + (p_value > alpha);
disp('[ X | X <= 1/3] and X/3 symmetry: ');
disp(['p_value is: ', num2str(p_value)]);
disp_same_distr(p_value, alpha);

% disp(['p_sum_1 is: ', num2str(p_sum_1)]);
% disp(['p_sum_2 is: ', num2str(p_sum_2)]);


% Visualisation
if is_print
    sym_1_2_vis(x);
    self_sym_vis(x);
end


%% Subtask_3

% Initialization

clear;
n = 10 ^ 5;
is_print = true; 

% Carry out


% Visualisation

if is_print
    fig_1 = figure();
    ax_1 = gca;
    set(ax_1, 'Xscale','log');
    fig_2 = figure();
    ax_2 = gca;
    set(ax_2, 'Xscale','log');
    ind_vec = (1:n)' ;
    for i = 1:3
        [x, ~] = cantrnd(n);
        exp_val = cumsum(x) ./ ind_vec;
        hold(ax_1, 'on');
        plot(ax_1, exp_val);
        hold(ax_1,'off');        
        var = cumsum( (x - exp_val(end)) .^ 2 ) ./ ind_vec;
        hold(ax_2, 'on');
        plot(ax_2, var);
        hold(ax_2,'off'); 
        ind_vec = cat(1, ind_vec, (n+1:n*10)' );
        n = n * 10; 
    end
    xlabel( ax_1, 'sample size');
    ylabel( ax_1 ,'empirical expected value');
    legend(ax_1, 'first sample', 'second sample', 'third sample');
    xlabel( ax_2, 'sample size');
    ylabel( ax_2, 'empirical variance');
    legend(ax_2, 'first sample', 'second sample', 'third sample');
    grid(ax_1, 'on');
    grid(ax_2, 'on');
    print(fig_1 ,'pict\exp_val_vis','-dpng','-r400');
    print(fig_2 ,'pict\var_vis','-dpng','-r400');
    title(ax_1, 'Empirical expected value'); 
    title(ax_2, 'Empirical variance'); 
    
end
