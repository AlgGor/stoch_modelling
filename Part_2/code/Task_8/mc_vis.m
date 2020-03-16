function mc_vis(solution_mat,n_hit)

    n = size(solution_mat,1);
    tmp_vec = linspace(-1,1,n);
    [x_mat, y_mat] = meshgrid(tmp_vec, tmp_vec);

    fig = figure();
    ax_1 = gca;
    
    surf(ax_1, x_mat, y_mat, solution_mat);
      
    xlabel(ax_1,  'x');
    ylabel(ax_1, 'y');
    zlabel(ax_1, 'u');
    grid on;
    name = ['mc_', num2str(n), '_', num2str(n_hit)];
    print(fig ,['pict\',name],'-dpng', '-r400');
    title(ax_1, 'Empirical solution');   
    
    fig = figure();
    ax_1 = gca;
    
    surf(ax_1, x_mat, y_mat, x_mat.^2 - y_mat.^2 + solution_mat*0);
      
    xlabel(ax_1,  'x');
    ylabel(ax_1, 'y');
    zlabel(ax_1, 'u')
    grid on;
    name = ['an_', num2str(n), '_', num2str(n_hit)];
    print(fig ,['pict\',name],'-dpng', '-r400');
    title(ax_1, 'Analiticalical solution');  
    
     fig = figure();
    ax_1 = gca;
    
    surf(ax_1, x_mat, y_mat, abs( solution_mat - (x_mat.^2 - y_mat.^2)));
      
    xlabel(ax_1,  'x');
    ylabel(ax_1, 'y');
    zlabel(ax_1, 'u');
    grid on;
    name = ['e_', num2str(n), '_', num2str(n_hit)];
    print(fig ,['pict\',name],'-dpng', '-r400');
    title(ax_1, 'Error');   
    
    
end