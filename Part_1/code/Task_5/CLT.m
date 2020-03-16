function CLT(clt_vec, var)
    
    sigma = sqrt(var);
    fig = figure();
    x_vec = sigma * linspace(-3,3);
       
    h1 = histogram(clt_vec, 70); 
    h1.Normalization = 'pdf';

    hold on;
    plot(x_vec, normpdf(x_vec,0, sigma), 'Color', [0.8500 0.3250 0.0980]);
    xlim(3 * sigma* [-1, 1] );
    xlabel( '$$\sqrt{n}\cdot\Big(S_n \slash n - \mu\Big)$$', 'interpreter', 'latex');
    ylabel( 'probability');
    legend( 'empirical', 'theoretical norm');
    label('Central limit theorem')
    grid on;
    hold off;
    
    print(fig ,'pict\CTL','-dpng', '-r400');



end