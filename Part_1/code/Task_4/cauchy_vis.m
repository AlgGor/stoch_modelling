function cauchy_vis(x_0, gamma, n)
    
    %alpha = 0.005;  99.9% of distribution is in x_vec
    alpha = 0.02; % it is 96% of distribution in x_vec
    cauchy_vec = cauchy_rnd(x_0, gamma, n);
    
    
    fig = figure();
    ax_1 = gca;
    
    x_vec = x_0 + gamma * linspace(tan(pi * (alpha - 0.5)), tan( pi * (1 - alpha - 0.5)));
    h1 = histogram(ax_1, cauchy_vec, 'BinEdges', x_vec); 
    h1.Normalization = 'pdf';
    hold on;
    cauchy_pdf = @(x_vec) (gamma ./ ((x_vec - x_0).^2 + gamma^2)) ./ pi;
    plot(x_vec, cauchy_pdf(x_vec) , 'Color', [0.8500 0.3250 0.0980]);
    hold off;
      
    xlim(ax_1,  [x_vec(1), x_vec(end)]);
    xlabel(ax_1,  'value of random variable');
    ylabel( ax_1, 'probability density');
    legend(ax_1, 'empirical', 'theoretical');
    grid on;
    print(fig ,'pict\cauchy_vis','-dpng', '-r400');
    title(ax_1, 'Cauchy distribution');   

end