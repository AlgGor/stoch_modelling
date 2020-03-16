function x = cauchy_rnd(x_0, gamma, n, varargin)

    if nargin < 4
        x = x_0 + gamma * tan(pi * (rand(n,1) - 0.5));
    else
        x = x_0 + gamma * tan(pi * (rand(n,varargin{:}) - 0.5));
    end
    
end