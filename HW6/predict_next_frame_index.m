function [lowpass, highpass] = predict_next_frame_index(video, positions, mask,n)
% Input arguments: video - 3D structure (rows x cols x frames) containing video frames
% (there are 16 frames in total)
% positions - position/motion vector for the object for each frame (of dimensions 2x16, ...
% each having [x;y] )
% mask - mask for object in the image (of logical type, same for all frames, of size 43x50)
% Output arguments: predict1 - output of prediction step for the first frame
% update1 - output of the update step for the first frame

% Put even and odd frames into separate banks
dE = video(:,:,1:2:end);
dO = video(:,:,2:2:end);
gray = 0.5*ones(size(mask));

% Prediction
% Cut out the object from frame n and fill the uncovered background with gray
frame1 = dE(:,:,n);
obj_rabbit = frame1(positions(2,n):positions(2,n)+size(mask,1)-1, positions(1,n):positions(1,n)+size(mask,2)-1);
prediction = paste_mask(frame1, positions(:,n), gray, [1 1], mask);

% Paste the object to the new location
prediction = paste_mask(prediction, positions(:,n+1), obj_rabbit, [1 1], mask);

% Negate the prediction
predict1 = - prediction;


%Update
% Obtain the difference image 
frame2 = dO(:,:,n);
residual =  frame2+ predict1;

% Move the object region in the difference signal back to where it was in the even frame
update1 = residual;
update1= paste_mask(update1, positions(:,n),residual,positions(:,n+1),mask);

% Weight the update step output by 0.5
update1 = update1*0.5;


%lowpass highpass
lowpass = frame1+update1;
highpass = residual;
end

