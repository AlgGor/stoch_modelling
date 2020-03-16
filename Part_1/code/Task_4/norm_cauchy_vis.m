function norm_cauchy_vis(x_vec, varargin)

    fig = figure();
    
    normplot([x_vec varargin{:}]);
    
    xlabel( 'value of random variable');
    ylabel( 'probability');
    title('')
    grid on;
    if isempty(varargin)
        legend({'Normal from cauchy'},'Location','southeast'); 
    else
        legend({'Normal from cauchy', '\mu+ \sigma X, X \sim N(0,1)'},'Location','southeast'); 
    end
    print(fig ,'pict\norm_vis','-dpng', '-r400');
    
   
    title('Normal probability plot')
end