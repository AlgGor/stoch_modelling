function x = bernrnd(p, varargin)

    if (p>1) || (p<0)
        error('p = %4.2f is out of bounds [0, 1]',p)
    end
    
    if (nargin == 2) && (size(varargin{1},2) == 1)
        x = rand(1,varargin{1})< p;
    else
        x = rand(varargin{:}) < p; 
    end
    
end