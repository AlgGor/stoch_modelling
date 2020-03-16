function queue_vis(t_vec, n_vec, lambda ,type)
    
    fig = figure();
    ax_1 = gca;
    
    hold on;
    plot(t_vec, n_vec, 'LineWidth', 1.2);
    hold off;
    
    xlabel(ax_1,  't');
    ylabel(ax_1, 'Size of queue');
    grid on;
    name = [type, '_', num2str(100*lambda)];
    print(fig, ['pict\', name], '-dpng', '-r400');
    if strcmp(type, 'hom')
        title(ax_1, 'Queue visualisation');   
    else
        title(ax_1, 'Nonhomogeneous poisson process')
    end
    
end