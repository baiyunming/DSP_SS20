function [acov, var, cov_h, cov_v] = autocov(im)
% Input argument: im - input image of type double [0..1]
% Output arguments: acov - autocovariance matrix
% var - variance
% cov_h - horizontal covariance
% cov_v - vertical covariance

neighborhood = 11;
nh2 = floor(neighborhood/2); % Neighborhood: nh2 elem. forward/backward

% 1. subtract mean
zeromean_im = im - mean(im,'all');

% 2. exclude borders
temp = zeros(neighborhood,neighborhood);
counter = 0 ; 

% 3. compute autocovariance matrix
for i = (nh2+1):(size(im,1)-nh2)
    for j = (nh2+1):(size(im,2)-nh2)
         temp = temp+ zeromean_im(i,j) .* zeromean_im(i-nh2:i+nh2, j-nh2:j+nh2);
        counter = counter+1;
    end
end
acov = temp/counter;
% 4. get variance, covariance in horizontal (one right) and vertical (one below) directions
var = acov(nh2+1,nh2+1);
cov_h = acov(nh2+1,nh2+2);
cov_v = acov(nh2,nh2+1);

%end


end