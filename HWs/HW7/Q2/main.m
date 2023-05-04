%**************************************************************************
% This is main function for question 2 of Home work 7                     *
% In main function first we read image                                    *
% then call 'edgeDetect' function to apply edge detection methods         *
% after that show all results                                             *
%**************************************************************************
clear all; clc;

img = imread('image.tif');

[R,G,B,all] = edgeDetect('laplacian',img);

figure;
subplot(2,3,1);
imshow(img,[]);
title('original image');
subplot(2,3,3);
imshow(rgb2gray(imabsdiff(img,all)),[]);
title('laplacian 3 channel');
subplot(2,3,4);
imshow(imabsdiff(img(:,:,1),R),[]);
title('laplacian in R channel');
subplot(2,3,5);
imshow(imabsdiff(img(:,:,2),G),[]);
title('laplacian in G channel');
subplot(2,3,6);
imshow(imabsdiff(img(:,:,3),B),[]);
title('laplacian in B channel');
%//////////////////////////////////////////////////////////////////////////
[R,G,B,all] = edgeDetect('sobel',img);

figure;
subplot(2,3,1);
imshow(img,[]);
title('original image');
subplot(2,3,3);
imshow(rgb2gray(imabsdiff(img,all)),[]);
title('sobel in 3 channel');
subplot(2,3,4);
imshow(imabsdiff(img(:,:,1),R),[]);
title('sobel in R channel');
subplot(2,3,5);
imshow(imabsdiff(img(:,:,2),G),[]);
title('sobel in G channel');
subplot(2,3,6);
imshow(imabsdiff(img(:,:,3),B),[]);
title('sobel in B channel');

%//////////////////////////////////////////////////////////////////////////
[R,G,B,all] = edgeDetect('Di-zenzo',img);

figure;
subplot(2,3,1);
imshow(img,[]);
title('original image');
subplot(2,3,3);
imshow(all,[]);
title('Di-zenzo in 3 channel');
subplot(2,3,4);
imshow(R,[]);
title('Di-zenzo in R channel');
subplot(2,3,5);
imshow(G,[]);
title('Di-zenzo in G channel');
subplot(2,3,6);
imshow(B,[]);
title('Di-zenzo in B channel');