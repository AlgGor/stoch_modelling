function orn_uhl_vis(t_vec, orn_uhl_vec, lambda, sigma, depth)

    fig = figure();
    ax_1 = gca;
    
    plot(t_vec, orn_uhl_vec, '.b');
      
    xlabel(ax_1,  't');
    ylabel(ax_1, 'X(t)');
    grid on;
    name = ['ou_', num2str(depth), '_', num2str(100*lambda), '_', num2str(100*sigma)];
    print(fig ,['pict\',name],'-dpng', '-r400');
    title(ax_1, 'Ornstein–Uhlenbeck process');   
    
end