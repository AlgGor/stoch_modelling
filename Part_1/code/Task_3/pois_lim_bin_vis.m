function pois_lim_bin_vis(x, lambda, n_tr)

    p = lambda/ n_tr;
    binom_vec = x;
    mu = ceil(n_tr * p);
    sigma =ceil( (n_tr * p * (1 - p)) ^ ( 1 / 2));
    k_max = max(binom_vec) ;
    k_min = min(binom_vec);

    fig = figure();
    ax_1 = gca;
    
    h1 = histogram( ax_1, binom_vec); 
    h1.Normalization = 'pdf';
 
    hold on;
    b_1 = bar(ax_1, k_min:k_max, binopdf( k_min:k_max, n_tr, p) );
    b_1.FaceAlpha = 0; 
    b_1.EdgeColor = [0.8500 0.3250 0.0980];
    b_1.LineWidth = 0.5; 
    b_1.BarWidth = 0.3;
    hold off;
    
    lambda = p * n_tr;
    ind_vec = 1:max(binom_vec); 
    hold on;
    b_2 = bar(ax_1, [0, ind_vec], [exp( -lambda), lambda .^ ind_vec * exp( -lambda) ./ cumprod(ind_vec)]);
    b_2.FaceAlpha = 0; 
    b_2.EdgeColor = [0 1 0];
    b_2.LineWidth = 0.4; 
    b_2.BarWidth = 0.7;
    hold off;
    
    xlim(ax_1, [-1 ;mu + 3 * sigma] );
    xlabel(ax_1,  'value of random variable');
    ylabel( ax_1, 'probability');
    legend(ax_1, 'empirical', 'theoretical bin', 'theoretical pois');
    grid on;
    print(fig ,'pict\pois_bin_vis','-dpng', '-r400');
    title(ax_1, 'Poisson distribution as a limit of binomial');
    
end