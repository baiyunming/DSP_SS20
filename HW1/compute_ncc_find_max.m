function [ncc_range, ncc_max_loc] = compute_ncc_find_max(im, range, fcnHandleNCC)
% Input arguments: 
% im - given image (of type double in range 0..1)
% range - vector containing elements from 1 till 300
% fcnHandleNCC - function handle to function "get_ncc(t1,t2)" -> see problem 2.3
% Output arguments: 
% ncc_range - vector of NCC values for the edge lengths from "range"
% ncc_max - location of maximum in NCC

% here you first compute ncc in the given range
bx = 1;  by = 1; % defined start of the search
[W,H] = size(im);
ncc_range = zeros(1,max(range));
for si = 1:length(range)

    % Cut atomic element
    atomic = im(1:si,1:si);
    % Create periodic image
    nx = ceil(H/si);
    ny = ceil(W/si);
    im_out = repmat(atomic, ny, nx);
    im_out = im_out(1:W,1:H);
    % Calc NCC   - for full image:
    ncc_range(1,si) = get_ncc(im_out,im);  
end

% then you find maximum in the way you like, just save the numbers you get
[~,ncc_max_loc] = findpeaks(ncc_range);
end

