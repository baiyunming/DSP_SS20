function blur_A = return_blur_A_matrix(n)
%Input argument: n - size of the filter (so that filter kernel is of size n x n)
%Output argument: blur_A - transformation matrix

% TODO: calculate blur_A as a function of n
blur_A = 0.5*diag(ones(1,n), 0) + 0.25*diag(ones(1,n-1), -1) + 0.25 * diag(ones(1,n-1), 1);


end