function [reducedMean,unreducedMean] = c(img)
% this function perform part "c" of question 1
% this function apply 3*3 median filter on image and after that perform
% part a and b of question 1 to this image
% inputs: img: original image
% outputs: reducedMean: size reduced image with mean filter
%          unreducedMean: size extend image with mean filter
    imgMean = medfilt2(img,[3 3],'zeros');
    
    reducedMean = a(imgMean);

    unreducedMean = b(reducedMean);
end

