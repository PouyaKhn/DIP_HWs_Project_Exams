%**************************************************************************
% This is main function for question 2 of Home work 6                     *
% In main function first we read image and convert it to double           *
% then call 'a' function to produce periodic noisy image and multiple     *
% notch filter. then call 'b' function to apply this notch filter to img  *
% and finally show all results                                            *
%**************************************************************************
clear all;clc;
img = double(imread('image.tif'));

[multipleNotch,noisyImageSpectrum,noisyImage] = a(img);

[noisyImageSpectrumRestore,result] = b(multipleNotch,img,noisyImageSpectrum);

figure;
subplot(2,3,1);
imshow(img,[]);
title('original image');
subplot(2,3,2);
imshow(real(noisyImage),[]);
title('noisy image');
subplot(2,3,3);
imshow(log(1+noisyImageSpectrum),[]);
title('noisy image spectrum');
subplot(2,3,4);
imshow(multipleNotch,[]);
title('multiple Notch filter');
subplot(2,3,5);
imshow(log(1+ noisyImageSpectrumRestore),[]);
title('multiple Notch filter applied');
subplot(2,3,6);
imshow(real(result),[]);
title('noise removal result');