%**************************************************************************
% This is addGaussianNoise function for part c of question 4              *
% In this function first we declare mean and variance of noise that we    *
% want add to the image. then add noise with imnoise function of MATLAB   *
%                                                                         *
% Inputs:  motionBlurResult: blurred image with motion blur effect        *
%                                                                         *
% Outputs: motionBlurNoiseResult: Blurred image that have gaussian noise  *
%          noise_var: gaussian noise variance                             *
%**************************************************************************
function [motionBlurNoiseResult,noise_var] = addGaussianNoise(motionBlurResult)

    noise_mean = 0;
    noise_var = 0.001;
    motionBlurNoiseResult = imnoise(motionBlurResult,'gaussian',noise_mean,noise_var);

end

