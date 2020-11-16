function haar_im = filter_image_haar(im, block_size, haar_4, fcnHandleBlockSplitter)
% Input arguments: im - input image (of type double in range 0..1)
% N - block_size
% haar_4 - haar matrix of size 16x16
% fcnHandleBlockSplitter - function handle to block splitter (see problem 1.1 for signature)
% Output argument: haar_im - output image, resulting in applying haar transform to each block

% Describe the block processor
% Haar transform on a block:  A * block_in * A' where A is the transform matrix
block_func = @(block, A) A*block*A'; % increasing brightness

% Apply block splitter and block processor with the given fcnHandleBlockSplitter
haar_im = fcnHandleBlockSplitter(im, block_size, block_func, haar_4);

end