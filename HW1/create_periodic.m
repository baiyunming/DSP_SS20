function im_out = create_periodic(im_atomic, atomic_mask, pm_mat, loc_base, size_output)
%% Input arguments:
% im_atomic - atomic element of the image
% atomic_mask - mask corresponding to the atomic element
% pm_mat - periodicity matrix
% loc_base - base location (x,y) (1x2) of the atomic element in the original
% size_output - needed size of the output
%
%% Output arguments
% im_out - output periodic image


im_out = zeros(size_output);

% YOUR SOLUTION HERE
% Calculate required range for nx, ny
ref_corner = [1 1; size_output(2) 1; 1 size_output(1); size_output(2) size_output(2)]' - repmat(loc_base,1,4);
transform_xy = inv(pm_mat)* ref_corner;
nx_range = floor(min(transform_xy(1,:))-1) : ceil(max(transform_xy(1,:))+1);
ny_range = floor(min(transform_xy(2,:))-1) : ceil(max(transform_xy(2,:))+1);

[atomsize_y, atomsize_x] = size(im_atomic);

% "Copy-Paste" the atomic element multiple times, add to output image
for nx = nx_range
    for ny = ny_range     
        % YOUR SOLUTION HERE
        
        % Calculate pixel positions top-left and bottom-right:
        pixel_topleft = loc_base + nx*pm_mat(:,1) + ny*pm_mat(:,2);
        pixel_bottomright =  pixel_topleft + flipud ( size ( im_atomic )') - 1;
        
        % Remove cols/rows outside matrix:
        x_index = pixel_topleft(1) : pixel_bottomright (1);
        y_index = pixel_topleft(2) : pixel_bottomright (2);
        
        maskx_index = 1:atomsize_x;
        masky_index = 1:atomsize_y;
        
        valid_x = and ( x_index>=1, x_index<=size_output(2));
        valid_y = and ( y_index>=1, y_index<=size_output(1));
        
        % Copy the atomic element with transparency mask
        im_out(y_index(valid_y),x_index(valid_x)) =im_out(y_index(valid_y),x_index(valid_x)) +  atomic_mask( masky_index(valid_y), maskx_index(valid_x)).*im_atomic(masky_index(valid_y), maskx_index(valid_x));

    end
end


end