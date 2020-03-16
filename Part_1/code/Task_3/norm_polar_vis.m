function norm_polar_vis(ksi_vec, name)

    mu = 0;
    sigma =1;

    fig = figure();
    x_vec = mu + sigma * linspace(-3,3);
    
    h1 = histogram(ksi_vec); 
    h1.Normalization = 'pdf';

    hold on;
    plot(x_vec, normpdf(x_vec), 'Color', [0.8500 0.3250 0.0980]);
    xlim(mu + 3 * sigma * [-1, 1] );
    xlabel( 'value of random variable');
    ylabel( 'probability');
    legend( 'empirical', 'theoretical norm');
    grid on;
    hold off;
    
    print(fig ,['pict\norm_vis', name],'-dpng', '-r400');
    
end