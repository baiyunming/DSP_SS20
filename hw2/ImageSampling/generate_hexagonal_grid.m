function [hexaX, hexaY] = generate_hexagonal_grid()
% Output arguments:
% hexaX - X coordinates of the hexagonal grid (matrix)
% hexaY - Y coordinates of the hexagonal grid (matrix)
sz = 512;
dx=(511-1)/(372-1);    % horizontal displacement in hexaX
dy = dx * sqrt(3)/2;   % vertical displacement in hexaY

% Compute hexaX and hexaY using meshgrid()
x = 1:dx:sz-1+0.5*dx;
y = 1:dy:sz;
[hexaX, hexaY] = meshgrid(x,y);

% Apply a shift on each 2nd raw by 0.5*dx to obtain the sampling scheme
[w,h] = size(hexaX);
for i = 2:2:w
       hexaX(i,:) = hexaX(i,:)+0.5*dx;
end

end