%**************************************************************************
% This is addMotionBlur function for part a of question 4                 *
% In this function first we calculate motion blur angle by tan inverse    *
% then we convert radian to degree and create PSF of motion blur effect   *
% with fspecial MATLAB function. then convert original image to double    *
% for reducing error of uint image. and finally apply this filter to      *
% image in convolution and circular mode with imfilter MATLAB function    *
%                                                                         *
% Inputs:  img: original uint8 image                                      *
%          a: motion direction in X                                       *
%          b: motion direction in Y                                       *
%          length: motion length parameter                                *
%                                                                         *
% Outputs: result: Blurred image with motion Blur effect                  *
%                  H: motion blur PSF with a,b,length parameters          *
%**************************************************************************
function [result,H] = addMotionBlur(img,a,b,length)

    theta = rad2deg(atan(b/a));
    H = fspecial('motion',length,theta);
    img = im2double(img);
    result = imfilter(img,H,'conv','circular');
    
end

