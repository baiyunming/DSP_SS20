function prew_z = prewitt_z()
% Output argument: 
% prew_z - absolute value of a complex number used for a frequency plot within freqz2()
% Define the prewitt filter

N=64;% default for: freqz2(h) uses [Ny Nx] = [64 64]

% Compute the NxN frequency spectrum with 0-padding:
h = fspecial('prewitt');
Y = fft2(h,N,N);
prew_z = abs(fftshift(Y));

end