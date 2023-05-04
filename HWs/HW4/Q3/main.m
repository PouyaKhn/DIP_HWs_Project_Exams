clear all;
clc;

img = imread('image.tif');
[P,Q] = one(double(img));
imgP = two(img,P,Q);
imgPcentered = three(imgP);
imgPcenteredFFT = four(imgPcentered);
[appliedFilter,H] = five(imgPcenteredFFT,P,Q);
finalP = six(appliedFilter);
final = seven(finalP,img);

figure;
subplot(3,3,1);
imshow(img);
title('original');

subplot(3,3,2);
imshow(uint8(imgP));
title('padded');

subplot(3,3,3);
imshow(uint8(imgPcentered));
title('padded centered');

subplot(3,3,4);
imshow(log(abs(imgPcenteredFFT)+1),[]);
title('padded centered FFT');

subplot(3,3,5);
imshow(H);
title('LP Filter');

subplot(3,3,6);
imshow(appliedFilter);
title('applied filter');

subplot(3,3,7);
imshow(uint8(finalP));
title('padded output');

subplot(3,3,8);
imshow(uint8(final));
title('final output');