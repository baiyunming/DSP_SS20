function [var_pyramid, mean_pyramid ]= calculate_statistics_pyramid(pyramid_structure)
% Input arguments: pyramid_structure - computed pyramid for 5 levels (cell array, each element corresponds to a particular level)
% Output arguments: var_pyramid - variances over pyramid levels
NL = 5;
var_pyramid = zeros(NL,1); % allocate memory
b = 4;              % ignore margins

for  i = 1: NL
    im = pyramid_structure{i};
    im_noborder = im(1+b:end-4, 1+b:end-4);
    var_pyramid(i) = var(im_noborder,0,'all');
    mean_pyramid(i) = mean(im_noborder,'all');
end

end