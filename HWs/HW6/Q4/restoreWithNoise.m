%**************************************************************************
% This is restoreWithNoise function for part c of question 4              *
% In this function first we calculate signal variance of original image   *
% then we calculate noise to signal ratio of corrupted image              *
% and finally we restore original image by deconvwnr MATLAB function      *
%                                                                         *
% Inputs:  img: original uint8 image                                      *
%          motionBlurNoiseResult: Blurred image with gaussian noise       *
%          noise_var: gaussian added noise variance                       *
%          H: motion blur PSF with a,b,length parameters                  *
%                                                                         *
% Outputs: result: restored image                                         *
%**************************************************************************
function result = restoreWithNoise(img,motionBlurNoiseResult,noise_var,H)

    signal_var = var(img(:));
    NSR = noise_var / signal_var;
    result = deconvwnr(motionBlurNoiseResult,H,NSR);

end

