clear all;
clc;

img = imread('image.tif');

a(img);

angle = int8(input('Please insert angle for rotation: '));

TFactorX = double(input('Please insert distance factor x for translation: '));

TFactorY = double(input('Please insert distance factor y for translation: '));

[rotated,transformed] = b(angle,TFactorX,TFactorY,img);

a(rotated);

a(transformed);

c(img,transformed,rotated);

img2 = imread('image2.tif');

d(img,img2);