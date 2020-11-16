% Implement blur as a seperable block transform
N = 16;
blur_A = return_blur_A_matrix(N);

% Apply blur matrix to the image 
im = im2double(imread('lenna_gray.jpg'));
block_processor_linear = @(block_in, A) A * block_in * A';
blur_lenna = block_splitter_image(im, N, block_processor_linear, blur_A);
figure, imshow(blur_lenna);