function [im_rec] = reconstructHexa(im, hexaX, hexaY)
% Input arguments: im - input grayscale image, of type double, in range 0..1
% hexaX, hexaY - hexagonal grid coordinates for X and Y
% Output arguments: im_rec - reconstructed grayscale image, of type double in range 0..1


% use linear interpolation
sz = min(size(im));
[imX, imY] = meshgrid(1:sz);  
im_linear = interp2(imX,imY,im,hexaX,hexaY,'linear');

%Apply triscatteredinterp function
F =  TriScatteredInterp(hexaX(:),hexaY(:),im_linear(:),'linear');
%Then interpolate image to the original image coordinates (these have to be computed first)
ti = 1:sz;
[qx,qy] = meshgrid(ti,ti);
im_rec = F(qx,qy);



end