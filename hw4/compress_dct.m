function im_rec_comp = compress_dct(dct_image, dct_matrix, fcnHandleBlkSplitter, N)
% input arguments: dct_image - image transformed to dct domain
% dct_matrix - DCT transformation matrix for block size 16
% fcnHandleBlkSplitter - function handle to split matrix into blocks, its signature is same as in Assignment 3, i.e.
% image_out = block_splitter(image_in, block_size, block_func, varargin)
% N - number of DCT coefficients that will be kept
% im_rec_comp reconstructed image using only N first DCT coefficients

block_size = 16;
block_processor_linear = @(block_in, A) A * block_in * A';
block_cut = @(block_in, A) A .*block_in;

% 1. remove all but first N coefficients
preserve_flag = zeros(block_size);
preserve_flag(1:sqrt(N),1:sqrt(N)) = 1;
im_cut = fcnHandleBlkSplitter(dct_image,block_size, block_cut ,preserve_flag);

% 2. back-transform the image using given function handles
im_rec_comp =  fcnHandleBlkSplitter(im_cut,block_size, block_processor_linear, dct_matrix');
end