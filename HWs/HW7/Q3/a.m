%**************************************************************************
% This is 'a' function for part 'a' of question 3                         *
% In this function we first resize image to 512*512 pixels                *
% then export 8*8 blocks from image                                       *
%                                                                         *
% Inputs:  img: original image                                            *
%                                                                         *
% Outputs: block: all blocks in 1 3D matrix                               *
%          resized: original resized image                                *
%**************************************************************************
function [block,resized] = a(img)

 resized = imresize(img,[512 512]);
 block = zeros(8,8,64);
 for i=0:(size(resized,1)/8)-1
     for j=0:(size(resized,2)/8)-1
         block(:,:,i*64 + j + 1) = resized( i*8+1 : (i+1)*8 , j*8+1 : (j+1)*8 );
     end
 end
end

