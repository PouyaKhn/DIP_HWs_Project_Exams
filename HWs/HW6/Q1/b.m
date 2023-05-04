%**************************************************************************
% This is 'b' function for part 'b' of question 1                         *
% In this function we create a BR filter and apply it on image            *
% and finally reconsruct original image                                   *
%                                                                         *
% Inputs:  img: original image                                            *
%          noisyImage: periodic noisy image                               *
%                                                                         *
% Outputs: resImage: restored image                                       *
%          filter: created BR filter                                      *
%**************************************************************************
function [resImage,filter] = b(img,noisyImage)

    filter = BRfilter(noisyImage,sqrt(2)*100);
    
    noisyImageSpectrum = abs(fft2(centered(noisyImage)));
    
    resImageSpectrum = noisyImageSpectrum .* filter ;
  
    resImage = centered(ifft2(resImageSpectrum .* exp(1i*angle(fft2(centered(img))))));
    resImage = real(resImage);
    resImage = imadjust(resImage);
  
end

