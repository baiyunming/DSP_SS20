% Output argument: 
% prew_z - absolute value of a complex number used for a frequency plot within freqz2()
% Define the prewitt filter

N=64;% default for: freqz2(h) uses [Ny Nx] = [64 64]

% Compute the NxN frequency spectrum with 0-padding:
h = fspecial('laplacian');
Y = fft2(h,N,N);
z_values = abs(fftshift(Y));

X = (-32:31) / 32;
[Xm,Ym] = meshgrid(X);
figure,mesh(Xm, Ym, z_values);title('prewitt with fft2 (your result)');
xlabel('X'); ylabel('Y');


%% 


filterprewitt = fspecial('prewitt')