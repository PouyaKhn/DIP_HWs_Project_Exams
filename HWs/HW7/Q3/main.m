%**************************************************************************
% This is main function for question 3 of Home work 7                     *
% In main function first we read image                                    *
% then call a~g functions for performing block coding of DCT and FFT      *
% and reconstruct image after coding and show results                     *
%**************************************************************************

clear all; clc;

img = imread('image.tif');

[block,resized] = a(img);

[blockFFT , blockDCT ] = b(block,resized);

maskDCT = c();

blockDCT = d(blockDCT,maskDCT);

resultDCT = e(blockDCT,resized);

resultFFT = f(blockFFT,resized);

g(resized,resultDCT,resultFFT);