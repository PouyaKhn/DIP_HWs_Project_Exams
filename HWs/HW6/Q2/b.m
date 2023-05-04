%**************************************************************************
% This is 'b' function for part b of question 2                           *
% In this function we apply notch filter to noisy image                   *
% and reconstruct restored image                                          *
%                                                                         *
% Inputs:  multipleNotch: notch filter that we create with some HF filters*
%          img: original image without noise                              *
%          noisyImageSpectrum: noisy image spectrum                       *
%                                                                         *
% Outputs: result: noise removed image                                    *
%          noisyImageSpectrumRestore: restored image spectrum             *
%**************************************************************************
function [noisyImageSpectrumRestore,result] = b(multipleNotch,img,noisyImageSpectrum)

     noisyImageSpectrumRestore = noisyImageSpectrum .* multipleNotch;
     
     result = centered(ifft2(noisyImageSpectrumRestore .* ...
         exp(1i*angle(fft2(centered(img))))));

end

