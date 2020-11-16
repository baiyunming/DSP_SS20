function [ar_gen, rh, rv, std_z] = generate_ar_image(cov_h, cov_v, var,b)
% Input arguments: cov_h - covariance in horizontal direction
% cov_v - covariance in vertical direction
% var - variance
% Ouput arguments: ar_gen - generated AR image
% rh - computed rh according to equation 1
% rv - computed rv according to equation 1
% std_z - computed std_z according to equation 1


n = 512; % Size of the image
%b = 100; % "Startup" border

% compute parameters rh,rv,std_z
rh = cov_h/var;
rv = cov_v/var;
std_z = sqrt(var*(1-rh^2)*(1-rv^2)); 

% allocate and append border
temp  = zeros(n+b);
noise = std_z*randn(n+b,n+b);
% generate AR process
for i = b+1:n+b
    for j = b+1:n+b
        temp(i,j) = rh*temp(i,j-1) + rv*temp(i-1,j) - rh*rv*temp(i-1,j-1)+noise(i,j);
    end
end


% remove border
ar_gen = temp(b+1:n+b,b+1:n+b);



end