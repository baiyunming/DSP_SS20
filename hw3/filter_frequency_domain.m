function [im_freq_filt_spat, im_freq_filt_freq] = filter_frequency_domain(im, N, sig1, sig2)
% Input arguments im - image
% N size of the Gaussian filter kernel
% sig1 - standard deviation of the first gaussian filter 
% sig2 - standard deviation of the second gaussian filter 
% Output arguments: 
% im_freq_filt_spat - spatial representation of filtering the image in frequency domain
% im_freq_filt_freq - frequency representation of filtering the image in frequency domain


% Calculate G in frequency domain
h1 = fspecial('gaussian',N,sig1) ;
h2 = fspecial('gaussian',N,sig2) ;
bandpass_spatial = h1-h2;
h_pad = padarray(bandpass_spatial, size(im) - size(bandpass_spatial), 'post'); % pad array with zeros
h_pad_shifted = circshift(h_pad, -floor(size(h1)/2)); % circularly shift the matrix to center the filter kernel
% h_pad_shifted = circshift(h_pad_shifted, size(im)/2);
bandpass_frequency = fft2(h_pad_shifted);


% Filter in frequency domain
% 1. Take the fft2 of the image and return as imf
imf = fft2(im);
% 2. Multiply the imf with G and return as the im_freq_filt_freq
im_freq_filt_freq = imf.*bandpass_frequency;
% 3. Take the ifft2 of im_freq_filt_freq and return as the im_freq_filt_spat
im_freq_filt_spat = ifft2(im_freq_filt_freq);



end