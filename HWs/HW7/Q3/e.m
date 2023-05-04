%**************************************************************************
% This is 'e' function for part 'e' of question 3                         *
% In this function we apply invers DCT filter to blocks and restore       *
% original blocks of image and after that combine all blocks              *
%                                                                         *
% Inputs:  blockDCT: result of applying DCT to blocks independently       *
%          resized: resized of original image                             *
% Outputs: resultDCT: result of coding image with dct and decoding that   *
%**************************************************************************
function resultDCT = e(blockDCT,resized)

   for k=1:size(blockDCT,3)
        blockDCT(:,:,k) = idct2(blockDCT(:,:,k));
   end
    
       resultDCT = double(resized) ;
    for i=0:(size(resultDCT,1)/8)-1
        for j=0:(size(resultDCT,2)/8)-1
            resultDCT( i*8+1 : (i+1)*8 , j*8+1 : (j+1)*8 ) = blockDCT(:,:,i*64 + j + 1);
        end
    end
    
end

