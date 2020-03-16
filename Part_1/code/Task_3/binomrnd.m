function x =binomrnd(p, n_tr, m_rv, varargin)

    if (p>1) || (p<0)
        error('p = %4.2f is out of bounds [0, 1]',p)
    end
    
    quant = 10^8;
    
    if nargin > 3
        x = zeros( [m_rv,varargin{1}] ); 
        n_elems = varargin{1} * m_rv;
    else
        x = zeros(m_rv,1);
        n_elems = m_rv;
    end

    n_quants_per_rv = max(1, ceil(n_tr / quant ));
    n_rv_per_quant = min(max( 1, floor(quant / n_tr)), n_elems);
    if (n_quants_per_rv == 1) 
        quant = n_tr;
    end
    
    n_rv_left = n_elems;
    sz_bern = [n_rv_per_quant, quant];
    cur_x = 0;
    
    while n_rv_left > 0
        samples_left = n_quants_per_rv;
        while samples_left > 0
            cur_x = cur_x + sum(bernrnd(p, sz_bern), 2);
            samples_left = samples_left - 1;
        end
        left_edge = n_elems - n_rv_left + 1; 
        right_edge = min(n_elems - n_rv_left + n_rv_per_quant, n_elems);
        x( left_edge : right_edge) = cur_x(1 : min(n_rv_left, n_rv_per_quant) );
        cur_x = cur_x * 0;
        n_rv_left = n_rv_left - n_rv_per_quant;
    end
    
end 