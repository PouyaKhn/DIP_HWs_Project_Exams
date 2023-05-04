clear all;
clc;

img = imread('image.tif');

blur = imfilter(img , ones(3,3)/9);

mask = double(img) - double(blur);

sharp = img + uint8(mask) ;

highBoost = img + 8 * uint8(mask);
highBoost = uint8(highBoost);

figure;

subplot(1,6,1);
imshow(img);
title('original image');

subplot(1,6,2);
imshow(blur);
title('blur image');

subplot(1,6,3);
imshow(uint8(mask),[]);
title('mask');

subplot(1,6,4);
imshow(mask,[]);
title('scaled mask');

subplot(1,6,5);
imshow(sharp);
title('unsharp masking');

subplot(1,6,6);
imshow(highBoost);
title('High Boost filtering');

