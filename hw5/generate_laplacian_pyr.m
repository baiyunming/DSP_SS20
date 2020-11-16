function laplacian_pyr = generate_laplacian_pyr(im, F, G)
%function laplacian_pyr = generate_laplacian_pyr(im, F, G)
% Input arguments: im - input image, of type double in range 0..1
% F - low pass filter
% G - reconstruction filter from C1.1 (3x3)
% Output arguments: laplacian_pyr - Laplacian pyramid (cell array with 5 elements, each corresponding to a particular level)

NL = 5; % number of levels

laplacian_pyr = cell(1,5); % allocate memory for the Laplacian pyramid
%F = 1/8 * [ 0 1 0 ; 1 4 1 ; 0 1 0 ]; % Gaussian filter
%G = 1/4 * [1 2 1; 2 4 2; 1 2 1];    % filter Kernel for interpolation


m = cell(1,5);
m{1} = im;

for level=1:NL
    if level == NL
         laplacian_pyr{level} =m{level} ;
         break;
    end
   % Filter & downsample
    lowpass_filtered = imfilter(m{level}, F, 'replicate');
    down_version = downsample(downsample(lowpass_filtered,2)',2)'; 
    m{level+1} = down_version;

    
   % Upsample again & filter
    up_version = upsample(upsample(down_version,2)',2)';
    rec_im = imfilter(up_version, G, 'replicate');
   % Compute difference image
    laplacian_pyr{level} =  m{level} - rec_im;
    
end






end