im = im2double(imread('lenna_gray.jpg'));
x0 = 50;
x_c = x0:120;
y0 = 70;
y_c = y0:140;
ims = im(y_c,x_c);
%% 
% Pad the ims with zeros to have the same size with the original image

ims_padded = padarray(ims,size(im)-size(ims),'post');
%% 
% Use the given formula to calculate the spatial shift
shifted_fft = fft2(ims_padded); 
fft_im = fft2(im);
fft_spatialshift = fft_im .* conj(shifted_fft) ./abs(fft_im .* conj(shifted_fft));
spatialshift = ifft2(fft_spatialshift);
[max_value,index] = max(spatialshift(:));
[y,x] = ind2sub(size(im), index);