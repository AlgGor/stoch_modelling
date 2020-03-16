function mmls_prop(lambda, n)
    
    exp_vec = exp_rnd(lambda, n);
    k = 0.5;
    m = 2;
        
    fig = figure();
    ax_1 = gca; 
    
    h1 = histogram(ax_1, exp_vec(exp_vec > k)-k); 
    edges = h1.BinEdges;
    hold on;
    h2 = histogram(ax_1, exp_vec(exp_vec > m + k) - m-k, edges, 'FaceAlpha', 0, ...
                                'LineWidth', 0.5, 'EdgeColor', [0.8500 0.3250 0.0980]);
    hold off;
    
    h1.Normalization = 'pdf';
    h2.Normalization = 'pdf';
    
    xlim(ax_1, [0, ceil( - log(0.005) / lambda)]);
    xlabel(ax_1,  'value of random variable');
    ylabel( ax_1, 'probability density');
    legend(ax_1, 'P(Y > n )', 'P(Y > m + n | Y > m )');
    grid on;
    print(fig ,'pict\mmls_prop','-dpng', '-r400');
    title(ax_1, 'Memoryless property');

end