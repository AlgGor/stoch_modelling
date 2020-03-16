function mu_vis(sample_size, x_average, conf_int_mu)
      
    fig = figure();
    ax_1 = gca;
    
    yneg = x_average - conf_int_mu(:,1);
    ypos = conf_int_mu(:,2) - x_average;
    errorbar(sample_size, x_average, yneg, ypos)
    set(ax_1,'Xscale','log');
      
    xlabel(ax_1,  'sample size');
    ylabel( ax_1, '\mu');
    legend(ax_1, 'empirical intervals');
    grid on;
    print(fig ,'pict\mu_conf','-dpng', '-r400');
    title(ax_1, 'Confidence intervals for \mu');   
    
end