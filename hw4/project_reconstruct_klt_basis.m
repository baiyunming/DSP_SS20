function [im_projected, im_backprojected, klt_psnr] = project_reconstruct_klt_basis(im, klt_base_v, block_splitter)
%% Input arguments:
% im - input image
% klt_base_v - KLT basis (as obtained before)
% block_splitter - block splitter function handle (signature as used before in HW3)
%% Output arguments:
% im_projected - image projected onto KLT basis
% im_backprojected - back-projected image (e.g. projected onto original basis after projecting onto KLT basis)
% klt_psnr - PSNR of the difference image (e.g. of the image im_backprojected - im)
m = sqrt(size(klt_base_v,1));
% 1.a First define block processor for orthogonal base projection
function block_out = block_processor_orth_base_proj(block_in, base)
    block_out = reshape(base'*block_in(:),m,m);
end

% 1.b. Define block processor for othogonal base backprojecting
function block_out = block_processor_orth_base_backproj(block_in, base)
     block_out = reshape(base*block_in(:),m,m);
end

% 2. Then using a block splitter project the image
im_projected = block_splitter(im, m, @block_processor_orth_base_proj, klt_base_v);
% 3. Then backproject to the original image
im_backprojected = block_splitter(im_projected, m, @block_processor_orth_base_backproj, klt_base_v);
% 4. And compute PSNR of the difference
[W,H] = size(im);
MSE= sum((im(:,:)-im_backprojected(:,:)).^2,'all')/(W*H);
klt_psnr = 10* log10(1/MSE);
end