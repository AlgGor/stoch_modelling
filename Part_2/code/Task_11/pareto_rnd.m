function x = pareto_rnd(x_m, k, n, varargin)

    if nargin < 4
        x = x_m .* (rand(n, 1).^(-1/k));
    else
        x = x_m .* (rand(n, varargin{:}).^(-1/k));
    end
    
end