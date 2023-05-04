function [rotated,transformed] = b(angle,TFactorX,TFactorY,img)
% this function perform part 'b' of question 2
% this function rotate image by angle size and transform image by
% TFactorX and TFactorY with fill values of zero
% inputs: angle: rotation angle, TFactorX and TFactorY: factors for
% translating image, img: original image
% outputs: rotated: rotated image, transformed: transformed image
    rotated = imrotate(img,angle,'bilinear');
    
    transformed = imtranslate(img,[ TFactorX , TFactorY ],'FillValues',0);
    
end

