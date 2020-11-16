function [im_reconstruct, im_psnr] = reconstruct_image(pyramid, im, G)
% Input arguments: pyramid - pyramid representation of the image (cell array with 5 levels)
% im - input image, of type double in range 0..1
% G - reconstruction filter
% Output arguments: im_reconstruct - reconstructed image
% im_psnr - psnr of the difference image

NL = numel(pyramid);
b = 4; % border to ignore for PSNR

% 1. first set two levels to 0 (i.e. elements 1 and 2)
pyramid{1} = zeros(size(pyramid{1})); 
pyramid{2} = zeros(size(pyramid{2}));


% 2. Reconstruct images:
temp = pyramid{NL};

for level = 1:4
    % 2.a Upscale & filter previous (coarser) level
    up_version = upsample(upsample(temp,2)',2)';
    filtered_im = imfilter(up_version, G, 'replicate');
    % 2.b Add current level (difference image)
    temp = filtered_im+pyramid{NL-level};
end

im_reconstruct = temp;

% 3. Compute difference image and PSNR
psnr_im =  im (1+b:end-b,1+b:end-b);
psnr_rec = im_reconstruct(1+b:end-b,1+b:end-b);

error = sum((psnr_im(:,:)-psnr_rec(:,:)).^2,'all');
MSE= sum(error,'all')/numel(psnr_im);
im_psnr = 10* log10(1/MSE);


end