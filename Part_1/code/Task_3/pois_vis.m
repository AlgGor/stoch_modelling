function pois_vis(lambda, n)

    pois_vec = pois_rnd(lambda, n);
    fig = figure();
    ax_1 = gca; 
    
    h1 = histogram(ax_1, pois_vec); 
    hold on;
    ind_vec = 1:ceil(max(pois_vec)); 
    b = bar(ax_1, [0, ind_vec], [exp( -lambda), lambda .^ ind_vec * exp( -lambda) ./ cumprod(ind_vec)]);
    b.FaceAlpha = 0; 
    b.EdgeColor = [0.8500 0.3250 0.0980];
    b.LineWidth = 0.5; 
    b.BarWidth = 0.6;
    hold off;
    
    h1.Normalization = 'pdf';
    
    xlim(ax_1, [-1, (1 + 3) * lambda + 1]);
    xlabel(ax_1,  'value of random variable');
    ylabel( ax_1, 'probability density');
    legend(ax_1, 'empirical', 'theoretical');
    grid on;
    print(fig ,'pict\pois_exp_vis','-dpng', '-r400');
    title(ax_1, 'Poisson distribution');   



end