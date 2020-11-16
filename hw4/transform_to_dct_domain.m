function dct_image = transform_to_dct_domain(im, dct_matrix, fcnHandleBlkSplitter)
% Input arguments: im - input image of type double in range 0..1
% dct_matrix - DCT transform matrix
% fcnHandleBlkSplitter - function handle to block splitter with arguments (im, block size, 
% function handle to block transform, function arguments to block transform)
% Output argument: dct_image - dct transformed image

linear_block_transform = @(block_in, A) A*block_in*A'; % TODO change this to the correct block transform
block_sz = size(dct_matrix,1);

dct_image = fcnHandleBlkSplitter(im, block_sz, linear_block_transform, dct_matrix);

end