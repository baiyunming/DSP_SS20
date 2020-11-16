function [diag_filter_subsampled, diag_nonfilter_subsampled] = filter_subsample_zone_plate(Izp)
% Input arguments: 
% Izp-grayscale image of the zone plate of type double in range 0..1
% Output arguments: 
% diag_filter_subsampled - main diagonal of the filtered and subsampled image
% diag_nonfilter_subsampled-main diagonal of the non-filtered and subsampled image


% for first output filter and sub-sample Izp
h = fspecial('gaussian',[16 16],5);
Izp_filtered = imfilter(Izp,h,'symmetric');
Izp_filtered_sub = downsample(downsample(Izp_filtered,2)',2)';
diag_filter_subsampled = diag(Izp_filtered_sub);

% for second output just sub-sample Izp 
Izp_sub = downsample(downsample(Izp,2)',2)';
diag_nonfilter_subsampled = diag(Izp_sub);

end