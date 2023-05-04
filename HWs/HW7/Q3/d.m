%**************************************************************************
% This is 'd' function for part 'd' of question 3                         *
% In this function we apply mask to each block for lowering redundancies  *
%                                                                         *
% Inputs:  blockDCT: result of applying DCT to blocks independently       *
%          maskDCT: created mask for saving 15 most important indexes     *
% Outputs: blockDCT: result of applying mask to input blocks              *
%**************************************************************************
function blockDCT = d(blockDCT,maskDCT)
    for k=1:size(blockDCT,3)
        blockDCT(:,:,k) = blockDCT(:,:,k) .* maskDCT ;
    end
end

