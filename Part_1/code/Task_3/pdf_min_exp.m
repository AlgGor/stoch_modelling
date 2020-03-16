function pdf_min_exp(lambda_vec, m, n)
    
    min_vec = min(exp_rnd(lambda_vec, m, n), [], 2) ;
    fig = figure();
    ax_1 = gca; 
    
    h1 = histogram(ax_1, min_vec); 
    lambda_0 = sum(lambda_vec);
    hold on;
    x_vec = linspace(0, max(min_vec));
    plot(ax_1, x_vec, lambda_0 * exp( -lambda_0 .* x_vec)  ); 
    hold off;
    
    h1.Normalization = 'pdf';
    
    xlim(ax_1, [0, - log(0.005) / lambda_0]);
    xlabel(ax_1,  'Min(X1, ..., Xn)');
    ylabel( ax_1, 'probability density');
    legend(ax_1, 'empirical', 'theoretical');
    grid on;
    print(fig ,'pict\exp_min','-dpng', '-r400');
    title(ax_1, 'Min of exponential distributed random variables');   

end