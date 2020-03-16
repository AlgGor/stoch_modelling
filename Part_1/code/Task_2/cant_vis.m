function cant_vis(n)

    [x, cant_cdf] = cantrnd(n);
    
    fig = figure();
    ax_1 = gca;
    
    ecdf(ax_1, x);
    
    hold on;
    stairs(ax_1, sort(x), sort(cant_cdf), 'LineWidth', 1.7, 'LineStyle', '--');
    hold off;
    
    xlabel( ax_1, 'value of random variable');
    ylabel( ax_1, 'probability');
    legend(ax_1, 'empirical', 'theoretical');
    grid on;
    print(fig ,'pict\cant_vis','-dpng','-r400');
    title(ax_1, 'Singular distribution'); 
    
end