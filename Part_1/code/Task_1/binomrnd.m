function x =binomrnd(p, n, varargin)
    
    if (p>1) || (p<0)
        error('p = %4.2f is out of bounds [0, 1]',p)
    end
    sz_bern = [varargin{:}, n];
    last_dim = max(size(sz_bern, 2), 2);
    x = sum( bernrnd(p, sz_bern), last_dim);
    if last_dim == 2
        x = x';
    end
    
end