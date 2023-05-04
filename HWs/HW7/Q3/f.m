%**************************************************************************
% This is 'f' function for part 'f' of question 3                         *
% In this function we declare a mask to save 15 most important coeficients*
% then we apply mask to each block for lowering redundancies              *
% then we apply invers FFT filter to blocks and restore original blocks   *
% of image and after that combine all blocks
%                                                                         *
% Inputs:  blockFFT: result of applying FFT to blocks independently       *
%          resized: resized image of original image                       *
% Outputs: resultFFT: result of coding image with FFT and decoding that   *
%**************************************************************************
function resultFFT = f(blockFFT,resized)
   maskFFT = [ 1 1 1 1 1 0 0 0 ;
                1 1 1 1 0 0 0 0 ;
                1 1 1 0 0 0 0 0 ;
                1 1 0 0 0 0 0 0 ;
                1 0 0 0 0 0 0 0 ;
                0 0 0 0 0 0 0 0 ;
                0 0 0 0 0 0 0 0 ;
                0 0 0 0 0 0 0 0 ];
            
    
    for k=1:size(blockFFT,3)
        blockFFT(:,:,k) = blockFFT(:,:,k) .* maskFFT ;
    end
    
 
    
    for k=1:size(blockFFT,3)
        blockFFT(:,:,k) = ifft2(blockFFT(:,:,k));
    end
    
    resultFFT = double(resized) ;
    for i=0:(size(resultFFT,1)/8)-1
        for j=0:(size(resultFFT,2)/8)-1
            resultFFT( i*8+1 : (i+1)*8 , j*8+1 : (j+1)*8 ) = blockFFT(:,:,i*64 + j + 1);
        end
    end
end

