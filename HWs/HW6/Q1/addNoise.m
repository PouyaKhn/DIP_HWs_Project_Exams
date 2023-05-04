%**************************************************************************
% This is 'addNoise' function for part 'a' of question 1                  *
% In this function we create a periodic noise and add to the image        *
%                                                                         *
% Inputs:  img: original image                                            *
%          k: power of noise                                              *
%          freqX and freqY: frequencies(places) of spikes                 *
%                                                                         *
% Outputs: noisyImage: periodic noisy image                               *
%**************************************************************************
function noisyImage = addNoise(img, k, freqX, freqY)
[m,n]=size(img);
[x,y] = meshgrid(0:n-1,0:m-1);
noisyImage = img + k * sin(2*pi*(freqX*x/m + freqY*y/n));
end

