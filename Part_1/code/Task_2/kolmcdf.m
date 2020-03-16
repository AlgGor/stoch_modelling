function Fx = kolmcdf(x)
    
    eps = 1e-10;
    if x > 0 
        k =  sqrt( - log(eps) / 2) / x;
    else
        Fx = 0;
        return;
    end
    k_vec = 1:k;
    Fx = 1+ 2 * sum( ( (-1) .* exp( -2 * x^2 .* k_vec ) ) .^ k_vec );
    
end