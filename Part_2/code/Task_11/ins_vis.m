function ins_vis(t_vec, w_vec, lambda, w_0, c, k)
    
    fig = figure();
    ax_1 = gca;
    
    hold on;
    plot(t_vec, w_vec, 'LineWidth', 1.2);
    hold off;
    
    xlim([t_vec(1), t_vec(end)]);
    ylim([0, 1.1 * max(w_vec)]);
    xlabel(ax_1,  't');
    ylabel(ax_1, 'Capital');    
    grid on;
    name = ['ins_', num2str(100*lambda), '_', num2str(w_0),'_', num2str(100*c),'_', num2str(k) ];
    print(fig, ['pict\', name], '-dpng', '-r400');
    title(ax_1, 'Insurance company visualization');   
    
end