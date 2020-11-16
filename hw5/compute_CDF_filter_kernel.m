function [F,G] = compute_CDF_filter_kernel(f1d, g1d)
% Input arguments: f1d - separable 1D version for analysis
% g1d - separable 1D version for synthesis
% Output arguments: F - 2D filter kernel for CDF wavelet for analysis
% G - 2D filter kernel for CDF wavelet for synthesis
F =f1d*f1d';
G =g1d*g1d';
end