%**************************************************************************
% This is restore function for part b of question 4                       *
% In this function we remove motion blur effect with deconvwnr function   *
% deconvwnr() give corrupted image and motion blur PSF and restore it     *
%                                                                         *
% Inputs:  motionBlurResult: Blurred image with motion blur effect        *
%          H: point spread function of motion blur function               *
%                                                                         *
% Outputs: result: restored image                                         *
%**************************************************************************
function result = restore(motionBlurResult,H)

    result = deconvwnr(motionBlurResult,H);
    
end

