function p_value =  kolm_test(x, cant_cdf)
    
    [my_ecd_f, ~] =  ecdf(x);
    D_n = sqrt(numel(x)) * max(abs(unique(sort(cant_cdf)) - my_ecd_f(2:end)));
    p_value = 1 - kolmcdf(D_n);
    
end