%**************************************************************************
% This is main function for question 1 of Home work 7                     *
% In main function first we read image                                    *
% then call 'a' function to convert image colors to safe colors           *
% after that call 'b' function to segment colors as question want         *
%**************************************************************************
clear all;
clc;
img = imread('image.tif');

safeColor = a(img);
b(safeColor,img);