function im_reorder = reorder_blocks(haar_im, N)
%Input arguments: haar_im - input image of type double in range 0..1
% N - side length of the block (resulting in NxN)
%Output argument: im_reorder - reordered image

cell_haar_im =  mat2cell(haar_im,repmat(N,1,size(haar_im,1)/N),repmat(N,1,size(haar_im,2)/N));
[W,H] = size(haar_im);
im_reorder = zeros(size(haar_im));
 
for i = 1:size(im_reorder,1)
    for j = 1:size(im_reorder,2)
        im_reorder(i,j) = cell_haar_im{ceil(mod(i-0.5,(W/N))),ceil(mod(j-0.5,(H/N)))}(ceil(i/(W/N)),ceil(j/(H/N)));
    
    end
    
end