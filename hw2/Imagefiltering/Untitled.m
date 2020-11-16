pear = double(imread('pears.jpg'));

h_small = fspecial('gaussian',[5 5],1);
pear1 = conv2(pear,h_small);
figure;
imshow(uint8(pear1));

h_large = fspecial('gaussian',[5 5],6);
pear1 = conv2(pear,h_large);
figure;
imshow(uint8(pear1));