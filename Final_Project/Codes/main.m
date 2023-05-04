%**************************************************************************
% This is main function for DIP final project.                            *
% In this project, we implement 2 proposed algorithms for removing noise  *
% in high corrupted images with impulse noise.                            *
% we apply this algorithms to 3 popular images: baboon,lena,cameraman     *
% and finally show all results                                            *
%**************************************************************************
clear all;
clc;

img1 = rgb2gray(imread('baboon.png'));
img2 = imread('lena.tif');
img3 = imread('cameraman.tif');
%//////////////////////////////////////////////////////////////////////////
percentage = uint8(input('Please insert percentage: '));
noisyImage1 = addNoise(img1,percentage);
noisyImage1 = uint8(noisyImage1);
resImageMethodOne1 = methodOne(noisyImage1);
resImageMethodTwo1 = methodTwo(noisyImage1,img1);
%//////////////////////////////////////////////////////////////////////////
noisyImage2 = addNoise(img2,percentage);
noisyImage2 = uint8(noisyImage2);
resImageMethodOne2 = methodOne(noisyImage2);
resImageMethodTwo2 = methodTwo(noisyImage2,img2);
%//////////////////////////////////////////////////////////////////////////
noisyImage3 = addNoise(img3,percentage);
noisyImage3 = uint8(noisyImage3);
resImageMethodOne3 = methodOne(noisyImage3);
resImageMethodTwo3 = methodTwo(noisyImage3,img3);
%//////////////////////////////////////////////////////////////////////////
figure;
subplot(1,3,1);
imshow(noisyImage1);
title('noisy image');
subplot(1,3,2);
imshow(resImageMethodOne1,[]);
title('method 1 algo');
subplot(1,3,3);
imshow(resImageMethodTwo1,[]);
title('method 2 algo');

figure;
subplot(1,3,1);
imshow(noisyImage2);
title('noisy image');
subplot(1,3,2);
imshow(resImageMethodOne2,[]);
title('method 1 algo');
subplot(1,3,3);
imshow(resImageMethodTwo2,[]);
title('method 2 algo');

figure;
subplot(1,3,1);
imshow(noisyImage3);
title('noisy image');
subplot(1,3,2);
imshow(resImageMethodOne3,[]);
title('method 1 algo');
subplot(1,3,3);
imshow(resImageMethodTwo3,[]);
title('method 2 algo');