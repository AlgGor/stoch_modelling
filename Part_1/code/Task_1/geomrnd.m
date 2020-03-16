function x = geomrnd(p, varargin)
    
    if (p>1) || (p<0)
        error('p = %4.2f is out of bounds [0, 1]',p)
    end
    
    n_suc_left=  prod( [varargin{:}]);
    n_suc_got= 0;
    n_prev_fails = 0;
    
    if (nargin == 2) && (size(varargin{1},2) == 1)
        x = zeros(1, varargin{1});
    else
        x = zeros(varargin{:}); 
    end
    
    while n_suc_left > 0
        sample_size = ceil(n_suc_left / p) ;
        bern_tr_vec = rand(1, sample_size ) < p;
        geom_rnd_vec = diff( [0, find(bern_tr_vec), sample_size] );
        n_new_suc = numel(geom_rnd_vec) - 1; 
        if n_new_suc > 0
            right_edge = (n_suc_got + min( n_new_suc, n_suc_left ) ) ;
            x( (n_suc_got + 1) : right_edge ) = geom_rnd_vec(1 : min( n_new_suc, n_suc_left ));
            x(n_suc_got + 1) = x(n_suc_got + 1) + n_prev_fails;
            n_suc_got = n_suc_got + n_new_suc;  
            n_suc_left = n_suc_left - n_new_suc;
            n_prev_fails = 0 ;
        end
        n_prev_fails = n_prev_fails + geom_rnd_vec(end); 
        
    end
    
end