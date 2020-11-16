function [D, k, Izp] = calculate_zone_plate(N)
% input argument:
% N - side length of the image matrix D
% output arguments:
% D is the distance matrix from element (1,1)
% k - computed value of k
% Izp image of the zone plate

% add your code to calculate image matrix D
x = 1:N;
y = 1:N;
[X,Y] = meshgrid(x,y);
D = sqrt((X-1).^2 + (Y-1).^2);
% and to compute k
k = 1/ (D(N,N)^2 - D(N-1,N-1)^2) ;
% and to compute Izp - zone plate image
Izp = 0.5+0.5*cos(k*pi*D.^2);

end