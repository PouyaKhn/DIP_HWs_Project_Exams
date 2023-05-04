%**************************************************************************
% This is main function for question 4 of Home work 7                     *
% In main function first we read image                                    *
% then call a~e functions for computing prediction error                  *
% and coding image with huffman method and decode compress image          *
% and showing results plus calculation of result's entropy value          *
%**************************************************************************
clear all; clc;
mex unravel.c

img = imread('image.tif');

fHat = a(img);

code = b(fHat);

decode = c(code);

d(fHat,decode);

e(fHat,code);
