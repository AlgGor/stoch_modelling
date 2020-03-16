function geom_vis(p, n)
    
    geom_vec_1 = geomrnd(p, n);
    % In my geom_rnd k=1, 2, 3 and 
    % in geornd k=0, 1, 2, 3, so I need some corrections
    k_max = max(geom_vec_1) - 1;
    k_min = min(geom_vec_1) - 1; 
    
    fig = figure();
    ax_1 = gca;
    
    h1 = histogram(ax_1, geom_vec_1); 
    h1.Normalization = 'probability';
 
    hold on;
    b = bar(ax_1, k_min+1 : k_max+1, geopdf( k_min : k_max, p) );
    b.FaceAlpha = 0; 
    b.EdgeColor = [0.8500 0.3250 0.0980];
    b.LineWidth = 0.5; 
    b.BarWidth = 0.6;
    hold off;
    
    
    xlim(ax_1, [0, ceil(log(0.001)/log(1 - p))]);
    ylim('auto');
    xlabel(ax_1,  'value of random variable');
    ylabel(ax_1,  'probability');
    legend(ax_1, 'empirical', 'theoretical');
    grid on;
    print(fig ,'pict\geom_vis','-dpng', '-r400');
    title(ax_1, 'Geometric distribution');
    
end