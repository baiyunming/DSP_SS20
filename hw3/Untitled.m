% Lenna Image
im_lena = im2double(imread('lenna_gray.jpg'));
% Haar transform matrix
N = 4;
haar_4 = make_haar(N);
fcnHandleBlockSplitter = @block_splitter_image;
haar_im = filter_image_haar(im_lena, N, haar_4, fcnHandleBlockSplitter);
block_size = 4;
%% 
% Calculate statistics
% Input argument: haar_im - haar transformed input image of type double in range 0..1
% block_size is a size of the block (so that is of dims (block_size x block_size) )
% Output arguments: im_mean - mean of each coefficient over all blocks (of size block_size x block_size)
% im_var - variances of each coefficient over all blocks (of size block_size x block_size)

% 1. Do not forget to pad the input image for correct border treatment
padded_im = padarray(haar_im, ceil(size(haar_im)/block_size)*block_size - size(haar_im), 'replicate','post');
%% 

% 2. loop over blocks to get the correct part of each block into a new structure
im_reorder = reorder_blocks(padded_im, block_size);
%% 
cell_reorder_Image =  mat2cell(im_reorder,repmat(size(padded_im,1)/block_size,1,block_size),repmat(size(padded_im,2)/block_size,1,block_size));
% 3. calculate stats over a new structure: variance and mean
[w,h] = size(cell_reorder_Image);
im_mean = zeros(w,h);
im_var = zeros(w,h);

for i = 1:w
    for j = 1:h
        im_mean(i,j) = mean(cell_reorder_Image{i,j},'all');
        im_var(i,j) = var(cell_reorder_Image{i,j},0,'all');
    end
end
