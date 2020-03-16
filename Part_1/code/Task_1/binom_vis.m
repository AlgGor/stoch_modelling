function binom_vis(p, n_tr, n_rv)
    
    binom_vec = binomrnd(p, n_tr, n_rv);
    mu = ceil(n_tr * p);
    sigma =ceil( (n_tr * p * (1 - p)) ^ ( 1 / 2));
    k_max = max(binom_vec) ;
    k_min = min(binom_vec);

    fig = figure();
    ax_1 = gca;
    
    h1 = histogram( ax_1, binom_vec); 
    %h1.FaceAlpha = 0.5;
    h1.Normalization = 'probability';
 
    hold on;
    b = bar(k_min:k_max, binopdf( k_min:k_max, n_tr, p) );
    b.FaceAlpha = 0; 
    b.EdgeColor = [0.8500 0.3250 0.0980];
    b.LineWidth = 0.5; 
    b.BarWidth = 0.6;
    hold off;
    
    xlim(ax_1, mu + 3 * sigma * [-1, 1] );
    xlabel(ax_1,  'value of random variable');
    ylabel( ax_1, 'probability');
    legend(ax_1, 'empirical', 'theoretical');
    grid on;
    print(fig ,'pict\binom_vis','-dpng', '-r400');
    title(ax_1, 'Binomial distribution');
    
end