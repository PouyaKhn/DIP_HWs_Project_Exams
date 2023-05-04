%**************************************************************************
% This is 'b' function for part 'B' of question 3                         *
% In this function we apply DCT and FFT transform functions to blocks     *
%                                                                         *
% Inputs:  block: all blocks in 1 3D matrix                               *
%          resized: original resized image                                *
% Outputs: blockFFT: result of applying FFT to blocks independently       *
%          blockDCT: result of applying DCT to blocks independently       *
%**************************************************************************
function [blockFFT , blockDCT] = b(block,resized)

    blockFFT = block;
    blockDCT = block;

    for k=1:size(block,3)
        blockDCT(:,:,k) = dct2(blockDCT(:,:,k));
    end
    
    for k=1:size(block,3)
        blockFFT(:,:,k) = fft2(blockFFT(:,:,k)) ;
    end
    
end

