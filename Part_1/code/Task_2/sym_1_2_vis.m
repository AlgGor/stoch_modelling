function sym_1_2_vis(x)

    fig = figure();
    ax_1 = gca;
    
    ecdf(ax_1, x);
    
    hold on;
    ecdf(ax_1, 1- x);
    hold off;
    
    xlabel( ax_1, 'value of random variable');
    ylabel( ax_1, 'probability');
    legend(ax_1, 'Y', '1-Y');
    grid on;
    print(fig ,'pict\sim_1_vis','-dpng','-r400');
    title(ax_1, 'Y and 1 - Y symmetry'); 


end