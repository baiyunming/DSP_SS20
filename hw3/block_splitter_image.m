function image_out = block_splitter_image(image_in, block_size, block_func, block_arg)
% Input arguments: 
% image_in - input image
% block_size - scalar size of the 2D block (then the resulting block is of dimensions block_sizexblock_size)
% block_func - function handle to apply on each block, takes as input a block and block_arg and returns processed block of the same size
% block_arg - argument provided to block_func (to support notation AXA^t)
% Output arguments: 
% image_out - processed image (put together from processed blocks)

%1. pad the original matrix 
padded_im = padarray(image_in, ceil(size(image_in)/block_size)*block_size - size(image_in), 'replicate','post');

%2. convert matrix to cells
cell_Image =  mat2cell(padded_im,repmat(block_size,1,size(padded_im,1)/block_size),repmat(block_size,1,size(padded_im,2)/block_size));

% 3. apply block_func on each block
transformed_cell = cellfun(@(x) block_func(x,block_arg), cell_Image, 'UniformOutput',false);

% 4. convert cells back to matrix
transformed_matrix = cell2mat(transformed_cell);

% 5. Cut away padded areas
image_out = transformed_matrix(1:size(image_in,1),1:size(image_in,2));

end