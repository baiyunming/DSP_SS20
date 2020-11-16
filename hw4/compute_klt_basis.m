function klt_base = compute_klt_basis(im)
% Input arguments: im - input image
% Output arguments: blocks - 2D structure containing blocks of image
% C_im - autocorrelation matrix of an image for each coefficient over all blocks
% klt_base - basis images for this KLT transformation

N = 8; % N - size of the block

% 1. Allocate memory for blocks
sz = size(im);
x_arr = 1:N:(sz(2) - N+1);
y_arr = 1:N:(sz(1) - N+1);
blocks = zeros(length(x_arr) * length(y_arr), N*N);

%2. Regroup the input image into blocks
% do not forget, y goes along the first dimension (rows) of the image matrix, x goes along columns
% also important: we use row-major ordering!
for iy = 1:length(y_arr)
    for ix = 1:length(x_arr)
     % compute the blocks here
        block_matrix = im((iy-1)*N+1:iy*N,(ix-1)*N+1:ix*N);
        block_vector = block_matrix(:)';
        blocks((iy-1)*length(y_arr)+ix,:) = block_vector;
   end
end

%3. Compute autocorrelation over all blocks
C_im = blocks'*blocks/size(blocks,1);
%4. Compute eigenvalue decomposition of the autocorrelation matrix and thus get the KLT basis
[V,D] = eig(C_im);
[~,ind] = sort(diag(D),'descend');
eigenvalue = D(ind,ind); 
eigenvector = V(:,ind);

klt_basis_cell = cell(size(eigenvector,1)/N,size(eigenvector,2)/N);
for i =1: size(klt_basis_cell,1)
    for j = 1:size(klt_basis_cell,2)
        eigvec = eigenvector(:,(j-1)*size(klt_basis_cell,2)+i);
        klt_basis_cell{i,j} = reshape(eigvec,N,N);
    end
end
klt_base = cell2mat(klt_basis_cell);

end