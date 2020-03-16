function self_sym_vis(x)

    fig = figure();
    ax_2 = gca;
    
    ecdf(ax_2, x(x<1/3));
    
    hold on;
    ecdf(ax_2, x/3);
    hold off;
    
    xlabel( ax_2, 'value of random variable');
    ylabel( ax_2, 'probability');
    legend(ax_2, 'Y| Y<= 1/3 ', 'Y/3');
    grid on;
    print(fig ,'pict\sim_2_vis','-dpng','-r400');
    title(ax_2, ' [ Y | Y<= 1/3] and Y/3 symmetry'); 
    
end