function memless_vis(p, n)
    
    geom_vec_1 =  geomrnd(p, n);
    m = 6;
  
    fig = figure();
    ax_1 = gca;  
    
    h1 = histogram(ax_1, geom_vec_1); 
    hold on;
    h2 = histogram(ax_1, geom_vec_1(geom_vec_1 >= m) - m, 'BinWidth', 0.5);
    hold off;
    
    
    h1.Normalization = 'probability';
    h2.Normalization = 'probability';
    
    xlim(ax_1, [0, m + ceil( log(0.005)/log(1-p))]);
    ylim('auto');
    xlabel(ax_1,  'value of random variable');
    ylabel(ax_1, 'probability');
    legend(ax_1, 'P(Y > n )', 'P(Y > m + n | Y >= m )');
    grid on;
    print(fig ,'pict\mmls_prop','-dpng', '-r400');
    title(ax_1, 'Memoryless property');
    
end