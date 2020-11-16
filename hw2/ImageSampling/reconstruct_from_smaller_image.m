function im_rec = reconstruct_from_smaller_image(im_small, sz, gridX, gridY)
% Input arguments: 
% im_small - image of smaller size of type double in range (0,1), 
% from which reconstruction to be performed
% sz - size of the original image (square image assumed)
% gridX - grid X coordinates to which to interpolated
% gridY - grid Y coordinates to which to interpolated
% Output arguments: im_rec - reconstructed image

N = size(gridX, 1);

% 1. Apply triscatteredinterp function
F =  TriScatteredInterp(gridX(:),gridY(:),im_small(:),'linear');
% 2. Then interpolate image to the original image coordinates (these have to be computed first)
ti = 1:sz;
[qx,qy] = meshgrid(ti,ti);
im_rec = F(qx,qy);

end