function LLN(lln_vec)

    fig = figure();
    ax_1 = gca;
   
    hold on;
    plot(lln_vec, 'Color', [0.8500 0.3250 0.0980]);
    hold off;

    xlabel(ax_1,  'number of terms');
    set(ax_1,'Xscale','log');
    ylabel( ax_1, '$$\frac{S_n}{n} $$','interpreter','latex');
    grid on;
    print(fig ,'pict\LLN','-dpng', '-r400');
    title(ax_1, 'Law of large numbers');   

end