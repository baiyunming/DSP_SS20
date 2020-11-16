clc;
clear all;
close all;
%% 
% Load the original image
im = im2double(imread('lenna_gray.jpg'));
sz = min(size(im));

% Subsample the image with rectangular grid and interpolate to grid locations
N = 400;
[gridX, gridY] = generate_rect_grid(sz, N);
[im_small_linear, im_small_cubic] = interp_im_rect_grid(im, gridX, gridY);

% Interpolate the image to its original size
im_rec = reconstruct_from_smaller_image(im_small_linear, sz, gridX, gridY);
figure,imshow(im_rec);%1
figure,imshow(im_small_linear);%2