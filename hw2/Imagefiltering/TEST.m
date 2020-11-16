[D, k, Izp] = calculate_zone_plate(100);
%% 
Izp_2 = downsample(downsample(Izp,2)',2)';
Izp_2 = upsample(upsample(Izp_2,2)',2)';
figure,imshow(Izp_2);
Izp_4 = downsample(downsample(Izp,4)',4)';
Izp_4 = upsample(upsample(Izp_4,4)',4)';
figure,imshow(Izp_4);

figure,imshow(Izp);

%% 
%h = fspecial('gaussian',[16 16],3);
%Izp_filtered = imfilter(Izp,h,'symmetric');
%Izp_filtered_sub = downsample(downsample(Izp_filtered,4)',4)';
%Izp_gaussian = upsample(upsample(Izp_filtered_sub,4)',4)';
%figure,imshow(Izp_gaussian);


