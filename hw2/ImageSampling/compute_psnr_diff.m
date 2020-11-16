function psnr_diff = compute_psnr_diff(im, im_rec)
% Input arguments: im - original grayscale image, of type double, in range 0..1
% im_rec -reconstructed grayscale image, of type double, in range 0..1
% Output arguments: psnr_diff - psnr of the difference image (im_rec-im)
border = 5;
% implement psnr computation according to the formula

[w h] = size(im);
mse_matrix = zeros(w,h);
for i  = 1+border:w-border
    for j = 1+border:w-border
        mse_matrix(i,j) = (im(i,j)-im_rec(i,j))^2;
    end
end

total_mse = sum(mse_matrix,'all')/((w-border*2)*(h-2*border));
psnr_diff = 10 * log10(1/total_mse);

end