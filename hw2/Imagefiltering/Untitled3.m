N = 350;
[D, k, Izp] = calculate_zone_plate(N);
[diag_filter_subsampled, diag_nonfilter_subsampled] = filter_subsample_zone_plate(Izp);
figure, plot(diag_filter_subsampled, 'r'), hold on; plot(diag_nonfilter_subsampled, 'b'); legend('Filtered', 'Not filtered');
%% 

m = diag(Izp);
imshow(uint8(Izp));