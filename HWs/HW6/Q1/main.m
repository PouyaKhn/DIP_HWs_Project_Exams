%**************************************************************************
% This is main function for question 1 of Home work 6                     *
% In main function first we read image and convert it to double           *
% then we scale image values to [0,1]
% then call 'a' function to produce periodic noisy image                  *
% after that call 'b' function to restore image with band reject filter   *
% and finally call 'c' function to take noise pattern and show results    *
%**************************************************************************
clear all;
clc;
img = double(rgb2gray(imread("image.jpg")));
img = normalize(img,0,1);
noisyImage = a(img);

[resImage,filter] = b(img,noisyImage);
noisePattern = c(filter,noisyImage);

figure;

subplot(2,3,1);
imshow(img,[]);
title('original image');

subplot(2,3,2);
imshow(noisyImage,[]);
title('noisy image');

subplot(2,3,3);
imshow(real(noisePattern),[]);
title('noisy pattern');

subplot(2,3,4);
imshow(log(1 + abs(fft2(centered(noisyImage)))),[]);
title('spec of noisy image');

subplot(2,3,5);
imshow(filter,[]);
title('Band-Reject filter');

subplot(2,3,6);
imshow(resImage,[]);
title('restoration');