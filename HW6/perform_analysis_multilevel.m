function [var_0lp, var_hp, im_lp] = perform_analysis_multilevel(video, positions, mask)
% Input arguments: video - input video (rows x cols x frames), there are 16 frames in total
% positions - motion vectors indicating position of the moving object in the respective frame
% mask - mask for the object
% Output arguments: var_0lp - frame variances of LP-band (1x8)
% var_hp - cell array, containing vectors corresponding to each HP-subband frame variances ...
% (dimension 1x4, each of corresponding size)
% im_lp - frame of the last LP-subband (240x320)

% Lifting analysis function: returns the LP and HP subbands
    function [L, H] = lift_analysis(video, positions, mask)
        dE = video (:,:,1:2: end) ;
        dO = video (:,:,2:2:end);
        H = zeros(size(dO));
        L = zeros(size(dE));
        % Analysis
        for i = 1:size(video,3)/2
            [L(:,:,i), H(:,:,i)] = predict_next_frame_index(video, positions, mask, i);
        end
    end

% Repeat the analysis hierarchically and compute the variances
    % iterate over levels
    for j = 1:log2(size(video,3))

    end
    

[L1, H1] = lift_analysis(video, positions, mask);
for i = 1:8
    lowpass_frame = L1(:,:,i);
    highpass_frame = H1(:,:,i);
    var_0lp(1,i) = var(lowpass_frame(:));
    highpass1(1,i) = var(highpass_frame(:));
end
var_hp{1}  = highpass1;


position2 =  positions(:,1:2:end);
[L2, H2] = lift_analysis(L1, position2, mask);
for i = 1:4
    highpass_frame = H2(:,:,i);
    highpass2(1,i) = var(highpass_frame(:));
end
var_hp{2}  = highpass2;


position3 =  position2(:,1:2:end);
[L3, H3] = lift_analysis(L2, position3, mask);
for i = 1:2
    highpass_frame = H3(:,:,i);
    highpass3(1,i) = var(highpass_frame(:));
end
var_hp{3}  = highpass3;

position4 =  position3(:,1:2:end);
[L4, H4] = lift_analysis(L3, position4, mask);

var_hp{4}  = var(H4(:));
im_lp = L4;
end