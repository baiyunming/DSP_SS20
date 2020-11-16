im = im2double(imread('bell-south.jpg'));
[acov, var, cov_h, cov_v] = autocov(im);


[gen_ar, rh, rv, std_z] = generate_ar_image(cov_h, cov_v, var,100);
[acov_ar, var_ar,cov_h_ar ,cov_v_ar] = autocov(gen_ar);
%figure, surf(-5:5, -5:5, acov_ar); title('Autocovariance'); xlabel('X'); ylabel('Y');


im2 = im2double(imread('lenna_gray.jpg'));
[acov2, var2, cov_h2, cov_v2] = autocov(im2);


[gen_ar2, rh2, rv2, std_z2] = generate_ar_image(cov_h2, cov_v2, var2,100);
[acov_ar2, var_ar2,cov_h_ar2 ,cov_v_ar2] = autocov(gen_ar2);
%figure, surf(-5:5, -5:5, acov_ar); title('Autocovariance'); xlabel('X'); ylabel('Y');