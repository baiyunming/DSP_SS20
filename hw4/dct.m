im_in = zeros(2,2,2);
im_in(:,:,1) = [2 1; 2 0];
im_in(:,:,2) = [3 1; 2 0];
dct2 = dctmtx(2);

dct_matrix(:,:,1) = dct2*im_in(:,:,1);
dct_matrix(:,:,2) = dct2*im_in(:,:,2);

dct_matrix(:,:,1) = (dct2*dct_matrix(:,:,1)')';
dct_matrix(:,:,2) = (dct2*dct_matrix(:,:,2)')';

m  = permute(dct_matrix,[3 2 1]);
m(:,:,1) = dct2*flip(m(:,:,1));
m(:,:,2) = dct2*flip(m(:,:,2));

dct_matrix = flip(permute(m, [3 2 1]),3);