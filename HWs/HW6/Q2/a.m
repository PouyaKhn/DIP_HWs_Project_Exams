%**************************************************************************
% This is 'a' function for part a of question 2                           *
% In this function first we create C matrix that indicate place of        *
% spike values in fourie spectrum of image that show periodic noise       *
% then call addPeriodicNoise function produce image that have just spikes *
% then we boost this spikes by arithmetic mean filter                     *
% after that we add spikes to image spectrum and reconstruct result image *
% finally we produce Butterworth high pass filters and produce multiple   *
% notch filter with them                                                  *
%                                                                         *
% Inputs:  img: original image                                            *
%                                                                         *
% Outputs: multipleNotch: notch filter that we create with some HF filters*
%          noisyImageSpectrum: noisy image spectrum                       *
%          noisyImage: periodic noisy image                               *
%**************************************************************************
function [multipleNotch,noisyImageSpectrum,noisyImage] = a(img)

    C = [ 0 64; 64 64 ; -64 64 ];
   
    [r,R,S] = addPeriodicNoise(size(img,1),size(img,2),C);
     S = removeNoise(S,'amean',3,3);
    
    noisyImageSpectrum = abs(fft2(centered(img)));
    S = normalize(S,min(min(noisyImageSpectrum)),max(max(noisyImageSpectrum)));
    noisyImageSpectrum = noisyImageSpectrum + S;
    
    noisyImage = centered(ifft2(noisyImageSpectrum .* exp(1i*angle(fft2(centered(img))))));
    
    M = size(img ,1);
    N = size(img ,2);
    [Dk1,Dl1] = distance(M,N,0,64);
    [Dk2,Dl2] = distance(M,N,64,64);
    [Dk3,Dl3] = distance(M,N,-64,64);
    
     D0 = [15 ; 15 ; 15];
    
     multipleNotch = createNotch(Dk1,Dl1,Dk2,Dl2,Dk3,Dl3,D0);

end