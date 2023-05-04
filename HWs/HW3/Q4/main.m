clear all;
clc;

img = imread('image.tif');

plots = a();

eq = histogram_equalization(img);
eq = uint8(eq);

b(img,plots,eq);