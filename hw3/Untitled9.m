% Lenna Image
im_lena = im2double(imread('lenna_gray.jpg'));
% Haar transform matrix
N = 4;
haar_4 = make_haar(N);
fcnHandleBlockSplitter = @block_splitter_image;
haar_im_lena = filter_image_haar(im_lena, N, haar_4, fcnHandleBlockSplitter);
% Calculate statistics
[im_mean_lena, im_var_lena] = calculate_statistics(haar_im_lena, N);


% Mandrill Image
im_mandril = im2double(imread('mandrill_gray.png'));
% Haar transform matrix
N = 4;
haar_4 = make_haar(N);
fcnHandleBlockSplitter = @block_splitter_image;
haar_im_mandril = filter_image_haar(im_mandril, N, haar_4, fcnHandleBlockSplitter);
% Calculate statistics
[im_mean_mandril, im_var_mandril] = calculate_statistics(haar_im_mandril, N);


% Variances
figure,
plot(log(im_var_lena(:)), 'r'); grid on; hold on;
plot(log(im_var_mandril(:)), 'b');
legend('lena transformed', 'mandrill transformed');