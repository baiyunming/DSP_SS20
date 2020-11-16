function [atomic, mask] = get_atomic(im_ref, pm, loc_base)
% function to get atomic element for a given image im_ref
% Input arguments:
% im_ref - reference image of type double in range 0..1
% loc_base - starting location (size 1x2)
% pm - periodic matrix (size 2x2, where each column corresponds to a periodicity vector)
% Output arguments:
% atomic - atomic element of the image  of type double in range 0..1
% mask - corresponding mask for the atomic element

% 1. Define polygon (where first column is [0; 0]; the other columns are
% computed by using columns of pm using addition/subtraction):
poly = zeros(2,5);
% ENTER SOLUTION HERE
poly(:,1) = loc_base;
poly(:,2) = poly(:,1) + pm(:,1);
poly(:,3) = poly(:,2) + pm(:,2);
poly(:,4) = poly(:,3) - pm(:,1);
poly(:,5) = poly(:,4) - pm(:,2);


% 2. Creating mask for atomic element (parallelogram) with poly2mask
% here we shift the polygon by some sub-pixel fraction to get the required 
% number of pixels, DO NOT EDIT the two lines below
poly = poly + repmat([0; 0.4] - min(poly, [], 2), 1, 5);
sz_mask = round(max(poly, [], 2)); % computing the size of the mask

% compute mask using poly2mask
% ENTER SOLUTION HERE
mask = poly2mask(poly(1,:),poly(2,:),sz_mask(2),sz_mask(1));

% 3. Compute atomic element
% ENTER SOLUTION HERE
im_crop = im_ref(loc_base(2) : (loc_base(2)+sz_mask(2)-1),loc_base(1) : (loc_base(1)+sz_mask(1)-1));
atomic = im_crop .*mask;

end