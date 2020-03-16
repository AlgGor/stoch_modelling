%% Task 1

%% Subtask_1

% Initialization
clear;
p = 0.6; 
n_rv = 10^5;
n_tr = 100;
sz_1 = [2, 3];
sz_2 = [2, 3, 2];
is_print = true; 

% Carry out
disp('Bern:');
disp( bernrnd(p) );
%disp(bernrnd(p, n_tr));
%disp( bernrnd(p, sz_1) );
%disp( bernrnd(p, 4, 2) ) ;
%disp( bernrnd(p, sz_2) );   % the same inputs for all functions

binom_vec = binomrnd(p, n_tr);
disp( 'Binom:');
disp( binomrnd(p, n_tr, sz_2 ) );

% Visualisation
if is_print
    binom_vis(p, n_tr, n_rv);
end


%% Subtask_2

% Initialization

clear;
p = 0.4; 
n = 10^6;

sz_1 = [2, 3];
sz_2 = [4, 5, 3];
is_print = true; 

% Carry out
disp('Geom:');
disp(geomrnd(p, sz_1));

% Visualisation
if is_print
    geom_vis(p,n);
    memless_vis(p,n);
end


%% Subtask_3

% Initialization

clear;
p = 0.5; 
n = 10^6;
is_print = true; 

% Carry out

eagle_vec = ( (rand(1,n) < p) .* 2 ) - 1;
Y_n_vec = cumsum( eagle_vec ) ./ sqrt(n); 

% Visualisation

if is_print
    fig = figure();
    plot(Y_n_vec);
    grid on;
    xlabel('n');
    ylabel('Y_n');
    print(fig,'pict\h_t','-dpng');
    title('On "heads and tails"');
end
