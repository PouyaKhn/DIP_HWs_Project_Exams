%**************************************************************************
% This is main function for question 4 of Home work 6                     *
% In main function first we read image then we call inputParameters func  *
% when we have patameters a,b,length of motion blur function, we call     *
% addMotionBlur func to add motion blur effect to original image          *
% then call restore func to restore this corrupted image. after that we   *
% call addGaussianNoise func to add gaussian noise to blurred image       *
% then call restoreWithNoise func to restore it well as possible          *
% finally we show all results in one figure with suitable titles          *
%**************************************************************************
clear all; clc;

img = imread('image.tif');

[a,b,length] = inputParameters();

[motionBlurResult,H] = addMotionBlur(img,a,b,length);

restoreResult = restore(motionBlurResult,H);

[motionBlurNoiseResult,noise_var] = addGaussianNoise(motionBlurResult);

restoreResult2 = restoreWithNoise(im2double(img),motionBlurNoiseResult,noise_var,H);

figure;
subplot(2,3,1);
imshow(img);
title('original image');
subplot(2,3,2);
imshow(motionBlurResult);
title(strcat('motion blur with->','a: ',num2str(a),',b: ',num2str(b), ...
    ',length: ',num2str(length)));
subplot(2,3,3);
imshow(restoreResult);
title('restored by wiener fillter');
subplot(2,3,4);
imshow(img);
title('original image');
subplot(2,3,5);
imshow(motionBlurNoiseResult);
title('noisy motion blur image');
subplot(2,3,6);
imshow(restoreResult2);
title('restored by wiener fillter with parameters');