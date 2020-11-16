image_in = im2double(imread('lenna_gray.jpg'));
% Notation for block_splitter_image(image_in, block_size, block_func, block_arg)
fcnHandleBlkSplitter = @block_splitter_image;
M = 16;
dct_matrix = dctmtx(M);
dct_image = transform_to_dct_domain(image_in, dct_matrix, fcnHandleBlkSplitter);


[im_mean, im_var] = calculate_statistics(dct_image, M);

compressed_img = compress_dct(dct_image, dct_matrix, fcnHandleBlkSplitter, 64);
figure,imshow(compressed_img);

