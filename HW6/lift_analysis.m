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