% 1. Calculate the mean and covariance of KLT transformed Lenna image (KLT basis images are trained from Lenna image)
im_lenna = im2double(imread('lenna_gray.jpg'));
% KLT basis images of Lenna image
klt_base_v = compute_klt_basis(im_lenna);
block_splitter = @block_splitter_image;
[im_projected_lenna, ~, ~] = project_reconstruct_klt_basis(im_lenna, klt_base_v, block_splitter);
blocksize = 8;
[lena_mean, lena_var] = calculate_statistics(im_projected_lenna, blocksize);



% 2. Calculate the mean and covariance of KLT transformed Mandrill image (KLT basis images are trained from Lenna image)
% Here we project the Mandrill image onto the KLT basis images trained from Lenna image
im_mandrill = im2double(imread('mandrill_gray.png'));
% KLT basis images of Lenna image
[im_projected_mandrill, ~, ~] = project_reconstruct_klt_basis(im_mandrill, klt_base_v, block_splitter);
[mandrill_mean, mandrill_var] = calculate_statistics(im_projected_mandrill, blocksize);


% Variances
figure,
plot(log(lena_var(:)), 'r'); grid on; hold on;
plot(log(mandrill_var(:)), 'b');
legend('lena transformed', 'mandrill transformed');

