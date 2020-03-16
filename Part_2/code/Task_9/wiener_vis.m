function wiener_vis(t_vec, w_vec, alpha, power)

    fig = figure();
    ax_1 = gca;
    
    plot(t_vec, w_vec, '.b');
      
    xlabel(ax_1,  't');
    ylabel(ax_1, 'W(t)');
    grid on;
    name = ['w_', num2str(power), '_', num2str(10*alpha)];
    print(fig ,['pict\',name],'-dpng', '-r400');
    title(ax_1, 'Wiener process');   
    
end