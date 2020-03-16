function var_vis(sample_size, s_2_vec, conf_int_var)
      
    fig = figure();
    ax_1 = gca;
    
    yneg = s_2_vec - conf_int_var(:,1);
    ypos = conf_int_var(:,2) - s_2_vec;
    errorbar(sample_size, s_2_vec, yneg, ypos)
    set(ax_1,'Xscale','log');
      
    xlabel(ax_1,  'sample size');
    ylabel( ax_1, '\sigma^2');
    legend(ax_1, 'empirical intervals');
    grid on;
    print(fig ,'pict\var_conf','-dpng', '-r400');
    title(ax_1, 'Confidence intervals for \sigma^2');   
    
end