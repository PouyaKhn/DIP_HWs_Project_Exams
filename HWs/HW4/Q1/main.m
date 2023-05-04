clear all;
clc;

img = imread('image.tif');

reduced = a(img);

unreduced = b(reduced);

[reducedMean,unreducedMean] = c(img);

d(img,reduced,unreduced,reducedMean,unreducedMean);
