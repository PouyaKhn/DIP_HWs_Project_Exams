%**************************************************************************
% This is 'edgeDetect' function for part 'a' of question 2                *
% In this function we apply laplacian, sobel and di-zenzo method          *
% to image and calculate R,G,B channels one by one and all channel result *
%                                                                         *
% Inputs:  img: safe color image                                          *
%          type: edge detection method name                               *
%                                                                         *
% Outputs: R,G,B : result of applying method to specific channel          *
%          all: result of applying method to all channels(sum of R,G,B)   *
%**************************************************************************
function [R,G,B,all] = edgeDetect(type,img)
    switch type
        case 'laplacian'
           lapmask = [1 1 1; 1 -8 1; 1 1 1];
           R = img(:,:,1) - imfilter(img(:,:,1),lapmask,'replicate');
           G = img(:,:,2) - imfilter(img(:,:,2),lapmask,'replicate');
           B = img(:,:,3) - imfilter(img(:,:,3),lapmask,'replicate');
           all = img - imfilter(img,lapmask,'replicate');
        case 'sobel'
           sobelmask = [ -2 -2 0 ; -2 0 2 ; 0 2 2];
           R = img(:,:,1) - imfilter(img(:,:,1),sobelmask,'replicate');
           G = img(:,:,2) - imfilter(img(:,:,2),sobelmask,'replicate');
           B = img(:,:,3) - imfilter(img(:,:,3),sobelmask,'replicate');
           all = img - imfilter(img,sobelmask,'replicate');
        case 'Di-zenzo'
            [all , R , G , B] = diZenzo(img,0);
        otherwise
            error('type error');
    end
end

