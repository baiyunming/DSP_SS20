function [im_linear, im_cubic] = interp_im_rect_grid(im, gridX, gridY)
% Input arguments: im - input image to interpolate, of type double in range 0..1
% gridX - grid X coordinates to which to interpolate
% gridY - grid Y coordinates to which to interpolate
% Output arguments: im_linear - image of linear interpolation
% im_cubic - image of cubic interpolation

sz = min(size(im));
[imX, imY] = meshgrid(1:sz);   % original image is given at these positions

% now implement the interpolation using different options: cubic, linear

im_linear = interp2(imX,imY,im,gridX,gridY,'linear');
im_cubic = interp2(imX,imY,im,gridX,gridY,'cubic');

end