function x = exp_rnd(lambda_mat, varargin)
    
    if nargin > 2
        x = - 1 ./ lambda_mat .* log(1 - rand(varargin{:}));     
        % it is a deliberately decision: [1 2 3] .* [1 2 3; 4 5 6]
    else
        x = - 1 ./ lambda_mat' .* log(1 - rand(varargin{1},1));
    end
    
end