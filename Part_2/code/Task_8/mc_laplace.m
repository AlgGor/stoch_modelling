function solution_mat = mc_laplace(edge_temp_mat, edge_vec, inside_vec, n_hit)
    
    n = size(edge_temp_mat,1);
    cur_pos = edge_vec(ceil(rand() * numel(edge_vec)));
    cur_temp = edge_temp_mat(cur_pos);
    temp_mat = NaN(n);
    temp_mat(inside_vec) = edge_temp_mat(inside_vec) * (n_hit + 1) ;
    visit_mat = ones(n) * (n_hit+1) ;
    visit_mat(inside_vec) = 0;
    visit_mat(edge_vec) = n_hit + 1;
       
    while min(min(visit_mat)) < n_hit
        new_pos = make_step(cur_pos, inside_vec, n);
        if ismember(cur_pos, edge_vec) 
            cur_temp = edge_temp_mat(cur_pos);
            if ismember(new_pos, edge_vec)
                continue;
            end
        else
            temp_mat(cur_pos) = temp_mat(cur_pos) + cur_temp;
            visit_mat(cur_pos) = visit_mat(cur_pos) + 1;
        end
        cur_pos = new_pos;
    end
    solution_mat = temp_mat ./ visit_mat;
    
end



function new_pos = make_step(cur_pos, inside_vec, n)
    % Move types: 
    % 1 - right; 2 - up; 3 - left; 4 - down 
    new_pos = 0;
    
    while  ~ ismember(new_pos, inside_vec)
        
            mv_tp = ceil(rand() * 4);
            if (mv_tp == 2) || (mv_tp == 4)
                new_pos = cur_pos - (-1) ^ (fix(mv_tp/3));
            else
                new_pos = cur_pos + (-1) ^ (fix(mv_tp/2)) * n;
            end
            
    end
    
end