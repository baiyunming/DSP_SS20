% Input arguments im - image
% N size of the Gaussian filter kernel
% sig1 - standard deviation of the first gaussian filter 
% sig2 - standard deviation of the second gaussian filter 
% Output arguments: 
% im_freq_filt_spat - spatial representation of filtering the image in frequency domain
% im_freq_filt_freq - frequency representation of filtering the image in frequency domain

im = im2double(imread('lenna_gray.jpg'));
sig1 = 5;
sig2 = 9;
N = 16; % Size of the filter

% Calculate G in frequency domain
h1 = fspecial('gaussian',N,sig1) ;
h2 = fspecial('gaussian',N,sig2) ;
bandpass_spatial = h1-h2;

h_pad = padarray(bandpass_spatial, size(im) - size(bandpass_spatial), 'post'); % pad array with zeros
h_pad_shifted = circshift(h_pad, -floor(size(bandpass_spatial)/2)); % circularly shift the matrix to center the filter kernel
bandpass_frequency = fft2(h_pad_shifted);

% Filter in frequency domain
% 1. Take the fft2 of the image and return as imf
imf = fft2(im);
% 2. Multiply the imf with G and return as the im_freq_filt_freq
im_freq_filt_freq = imf.*bandpass_frequency;
% 3. Take the ifft2 of im_freq_filt_freq and return as the im_freq_filt_spat
im_freq_filt_spat = ifft2(im_freq_filt_freq);
%figure, imshow(abs(im_freq_filt_spat)*10);



shifted_fre = fftshift(bandpass_frequency);
%% 

% a1.2
conv_symmetric = imfilter(im,bandpass_spatial, 'symmetric');
%figure, imshow(abs(conv_symmetric)*10);
conv_replicate = imfilter(im,bandpass_spatial, 'replicate');
%figure, imshow(abs(conv_replicate)*10);
conv_circular = imfilter(im,bandpass_spatial, 'circular');
%figure, imshow(abs(conv_circular)*10);
%% 

%a 1.3
im_noise = imnoise(im,'salt & pepper',0.05);
figure, imshow(im);
figure, imshow(im_noise);

sig1 = 5;
sig2 = 9;
N = 16; % Size of the filter
[im_freq_filt_spat, im_freq_filt_freq] = filter_frequency_domain(im_noise, N, sig1,sig2);
figure, imshow(abs(im_freq_filt_spat)*10);
