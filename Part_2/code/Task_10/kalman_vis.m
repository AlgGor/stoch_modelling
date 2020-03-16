function kalman_vis(t_vec, sgn_vec, est_vec, conf_int_mat, type, sigma_1, lambda, param)
    
    fig = figure();
    ax_1 = gca;
        
    hold on;
    fill( [t_vec; flipud(t_vec) ],  [conf_int_mat(:,1); flipud(conf_int_mat(:,2))], 'g');
    plot(t_vec, sgn_vec, '.r');
    plot(t_vec, est_vec, 'b');
    hold off;
    
    xlabel(ax_1,  't');
    ylabel(ax_1, 'X(t)');
    grid on;
    name = [type, '_', num2str(100 * sigma_1), '_', num2str(100*lambda), '_', num2str(100*param)];
    legend(ax_1, 'conf int', 'signal', 'estimation');
    print(fig, ['pict\', name],'-dpng', '-r400');
    title(ax_1, 'Kalman filter or OU process');   
    
end