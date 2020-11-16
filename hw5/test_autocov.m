im = im2double(imread('lenna_gray.jpg'));
[acov,  var, cov_h, cov_v] = autocov(im);
nh2 = 5;
figure, surf(-nh2:nh2, -nh2:nh2, acov); title('Autocovariance'); xlabel('X'); ylabel('Y');