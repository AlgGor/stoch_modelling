function x_mat = norm_from_polar(mu, var, varargin)
    
    sigma = sqrt(var);
    omega_vec = exp_rnd(0.5, varargin{:});
    if nargin > 3
       phi_vec = rand(varargin{:}) * 2*pi;
    else
        phi_vec = rand(varargin{:},1) * 2*pi;
    end
    x_mat = mu + sigma * omega_vec.^(1/2) .* sin(phi_vec);
    
end