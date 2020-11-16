function video = reconstruct_video(pyr, pyr_vec, mask)
% Input arguments: pyr - pyramid containing all subbands of the analysed video
% pyr_vec - motion vector for all frames
% mask - matrix containing mask, in which 1 indicates the pixel where object is located and
% 0 for unoccupied pixels
% Output arguments: video - reconstructed video (3D array)


video = pyr{end};
for li = (length(pyr)-1) : -1 : 1;
    H = pyr{li};
    [video] = lift_synthesis(video, H, pyr_vec{li}, mask);
end




end