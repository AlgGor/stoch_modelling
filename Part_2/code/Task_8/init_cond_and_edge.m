function [edge_temp_mat, edge_vec, inside_vec] = init_cond_and_edge(n)
    
    [x_mat, y_mat] = meshgrid(linspace(-1,1,n), linspace(-1,1,n));
    
    z_mat = x_mat.^2 + y_mat.^2;
    
    logic_mat = z_mat > (1 + eps);
    inside_mat = (logic_mat < 0.5)*1;
    inside_vec = find(inside_mat);
    
    for ind = 1:n
        y_ind_first = find(inside_mat(:, ind),1);      y_ind_last = find(inside_mat(:, ind), 1, 'last');
        inside_mat(y_ind_first, ind) = 3;               inside_mat(y_ind_last, ind) = 3;
        x_ind_first = find(inside_mat(ind, :),1);      x_ind_last = find(inside_mat(ind, :), 1, 'last');
        inside_mat(ind, x_ind_first) = 3;               inside_mat(ind, x_ind_last) = 3;
    end
    edge_vec = find(inside_mat > 2);
    z_mat = z_mat * 0;
    edge_temp_mat = x_mat.^2 - y_mat.^2;
    z_mat(edge_vec) = edge_temp_mat(edge_vec);
    edge_temp_mat = z_mat;
    
end


