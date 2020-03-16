function exp_vis(lambda, n)
    
    exp_vec = exp_rnd(lambda, n);
    fig = figure();
    ax_1 = gca; 
    
    h1 = histogram(ax_1, exp_vec); 
    hold on;
    x_vec = linspace(0, max(exp_vec));
    plot(ax_1, x_vec, lambda * exp( -lambda .* x_vec)  ); 
    hold off;
    
    h1.Normalization = 'pdf';
    
    xlim(ax_1, [0, - log(0.001) / lambda]);
    xlabel(ax_1,  'value of random variable');
    ylabel( ax_1, 'probability density');
    legend(ax_1, 'empirical', 'theoretical');
    grid on;
    print(fig ,'pict\exp_vis','-dpng', '-r400');
    title(ax_1, 'Exponential distribution');   
    
end