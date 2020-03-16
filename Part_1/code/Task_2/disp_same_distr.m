function disp_same_distr(p_value, alpha)
    
    if p_value > alpha
        disp('Vectors are different distributed');
    else
        disp('Vectors have the same distribution');
    end
    disp(' ');
    
end