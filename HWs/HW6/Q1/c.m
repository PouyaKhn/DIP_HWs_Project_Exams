%**************************************************************************
% This is 'c' function for part 'c' of question 1                         *
% In this function we calculate band pass filter from BR filter           *
% and with BP filter, recover noise pattern from noisy image              *
%                                                                         *
% Inputs:  BR: band reject filter                                         *
%          noisyImage: periodic noisy image                               *
%                                                                         *
% Outputs: noisePattern: periodic noise pattern in spatial domain         *
%**************************************************************************
function noisePattern = c(BR,noisyImage)
    BP = 1 - BR ;
    
    noisyImageSpectrum = abs(fft2(centered(noisyImage)));
    
    noisePattern = noisyImageSpectrum .* BP ;
    
    noisePattern = ifftshift(ifft2(noisePattern .* exp(1i*angle(fft2(centered(noisyImage))))));
  
end

