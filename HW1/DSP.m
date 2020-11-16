im = [1,2,3;4,5,6;7,8,9]

cR = [ 1 0 1 ;   0.3 1 0;   0   0.3 1 ];
cG = [ 0 1 1 ;   0.3 0 1;   0.7 0.3 0 ];
cB = [ 0 0 0 ;   1   1 0;   0.7 1   0 ];
im = double(im);
[W H] = size(im);

im_kron_r = zeros(3*W,3*H);
im_kron_g = zeros(3*W,3*H);
im_kron_b = zeros(3*W,3*H);

%% 
for i = 1:3
    for j = 1:3
        im_kron_r((i-1)*W+1:i*W, (j-1)*H+1:j*H) = cR(i,j) * im;
    end
end
%% 

for i = 1:3
    for j = 1:3
        im_kron_g((i-1)*W+1:i*W, (j-1)*H+1:j*H) = cG(i,j) * im;
    end
end
%% 

for i = 1:3
    for j = 1:3
        im_kron_b((i-1)*W+1:i*W, (j-1)*H+1:j*H) = cB(i,j) * im;
    end
end

%% 
im_kron_rgb(:,:,1) = im_kron_r;
im_kron_rgb(:,:,2) = im_kron_g;
im_kron_rgb(:,:,3) = im_kron_b;

figure,imshow(im_kron_rgb);