function [x, F] = cantrnd(n, eps)

    if nargin < 1
        n = 1;
    end
    if nargin < 2
        eps = 1e-10; 
    end
    
    m = round(-log(eps)/log(3));
    bern_mat = bernrnd(0.5,n,m);
    deg = -(1:m)';
    x = 2 * bern_mat * 3 .^ deg ;
    F = bern_mat * 2 .^ deg;
    
end