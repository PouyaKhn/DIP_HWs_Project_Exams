clear all;
clc;

img = rgb2gray(imread('image.jpg'));

percentage = uint8(input('Please insert percentage: '));
noisyImage = addNoise(img,percentage);
noisyImage = uint8(noisyImage);

median3 = medianFilter(noisyImage,3);
median5 = medianFilter(noisyImage,5);

iterativeOutput = iterative(noisyImage);
iterativeOutput = uint8(iterativeOutput);

window = double(input('Please enter window size for alpha trimmed: '));
alpha = double(input('And now please enter alpha between (0,0.5): '));
alphaTrim = alphaTrimmed(noisyImage,window,alpha);
alphaTrim = uint8(alphaTrim);

figure;
subplot(2,3,1);
imshow(img);
title('original image');
subplot(2,3,2);
imshow(noisyImage);
title('noisy image');
subplot(2,3,3);
imshow(median3);
title('mat med 3*3');
subplot(2,3,4);
imshow(median5);
title('mat med 5*5');
subplot(2,3,5);
imshow(iterativeOutput);
title('iterative');
subplot(2,3,6);
imshow(alphaTrim);
title('Alpha Trimmed');