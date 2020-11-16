function [gridX, gridY] = generate_rect_grid(sz, N)
% Input arguments: sz - size of the input image (square shape is assumed)
% N - required side size of the grid (so that we have a grid of size NxN)
% Output argument: [gridX, gridY] - X and Y coordinates of the rectangular grid
% implement grid calculation here
    x = linspace(1,sz,N);
    y =  linspace(1,sz,N);
    [gridX, gridY] = meshgrid(x,y);
end