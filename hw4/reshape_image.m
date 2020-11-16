function im_reshape = reshape_image(im,  block_splitter)
% Input argument: im - input image
% block_splitter - function handle of the block splitter
% Ouput argument: im_reshape - reshaped image
N = 32;%size of the block
v = zeros(N^2,1);
v([529:544,272:32:784]) = 0.1;
%implement reshaping here
func_handle = @(block, argv) reshape(block(:)+argv,N,N); % just preserve the block, change this!
im_reshape = block_splitter(im, N, func_handle, v);
end