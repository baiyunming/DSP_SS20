 function img = lift_synthesis(L, H, vec, mask)
        img = zeros(size(L,1),size(L,2),size(L,3)*2);
        for i = 1:size(L,3)
            i2 = 2*(i-1)+1; %index for lowpass motion vector, i2+1 highpass motion vector
        % Update
        upd = paste_mask(H(:,:,i), vec(:,i2),H(:,:,i),vec(:,i2+1),mask);       
        L(:,:,i) = L(:,:,i) - 0.5*upd;
        
        % Predict
        gray = 0.5*ones(size(mask));
       
        prediction = paste_mask(L(:,:,i),vec(:,i2),gray,[1 1],mask);
        prediction = paste_mask(prediction,vec(:,i2+1),L(:,:,i),vec(:,i2),mask);
        
        H(:,:,i) = H(:,:,i) + prediction;
        end
       
       img(:,:,1:2:end) = L; 
       img(:,:,2:2:end) = H; 
        
    end