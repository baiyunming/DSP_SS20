im = im2double(imread('lenna_gray.jpg'));

% Compute Laplacian pyramid with Gaussian filter
F = 1/8 * [ 0 1 0 ; 1 4 1 ; 0 1 0 ]; % Gaussian filter
G = compute_reconstruction_filter(); % Gaussian reconstruction filter
laplacian_pyr_gauss = generate_laplacian_pyr(im, F, G);


% Compute Laplacian pyramid with CDF filter
% Analysis filter coefficients
f1d = [0.0267487574108098,-0.0168641184428750,-0.0782232665289879,0.266864118442872,0.602949018236358,0.266864118442872,-0.0782232665289879,-0.0168641184428750,0.0267487574108098]';
% Synthesis filter coefficients
g1d = [-0.0912717631142495, -0.0575435262284996, 0.591271763114247, 1.11508705245699, 0.591271763114247, -0.0575435262284996, -0.0912717631142495]';
% Compute the 2D filter kernels for analysis and synthesis CDF filters
[F,G] = compute_CDF_filter_kernel(f1d, g1d);
laplacian_pyr_CDF= generate_laplacian_pyr(im, F, G);
% Calculate Statistics
[laplacian_pyr_CDF_var,laplacian_pyr_CDF_mean] = calculate_statistics_pyramid(laplacian_pyr_CDF);
[laplacian_pyr_gauss_var, laplacian_pyr_gauss_mean]= calculate_statistics_pyramid(laplacian_pyr_gauss);


figure;
semilogy(laplacian_pyr_gauss_var, 'b.-'); hold on;
semilogy(laplacian_pyr_CDF_var, 'r.-');
title(sprintf('Variance (energy) in \n pyramid levels (log-scale)'));
legend('gauss', 'cdf'); xlabel('Level');

figure;
plot(laplacian_pyr_gauss_mean, 'b.-'); hold on;
plot(laplacian_pyr_CDF_mean, 'r.-');
title(sprintf('Mean in \n pyramid levels (log-scale)'));
legend('gauss', 'cdf'); xlabel('Level');
