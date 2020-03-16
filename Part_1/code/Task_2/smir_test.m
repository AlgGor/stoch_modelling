function D_n_m = smir_test(x_1, x_2)

    m = size(x_1, 1);
    n = size(x_2, 1);
    [~, ind] = sort([x_1; x_2]);
    
    ind(ind > m ) = 1/n;
    ind(ind >= 1) = - 1/m; 
    
    D_n_m = max(abs(cumsum(ind)));   
    
end