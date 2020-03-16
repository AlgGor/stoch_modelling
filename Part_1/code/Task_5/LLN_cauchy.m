function LLN_cauchy(lln_vec)

    fig = figure();
    ax_1 = gca;
   
    hold on;
    plot(lln_vec);
    hold off;

    xlabel(ax_1,  'number of terms');
    set(ax_1,'Xscale','log');
    ylabel( ax_1, '$$\frac{S_n}{n} $$','interpreter','latex');
    grid on;
    print(fig ,'pict\LLN_cauchy','-dpng', '-r400');
    title(ax_1, 'LLN inapplicability with cauchy distribution');   

end