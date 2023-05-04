function imgPcenteredFFT = four(imgPcentered)
% Compute the DFT, F(u,v), of the image from step 3.
% inputs: imgPcentered: padded image that is center of frequency
% outputs: imgPcenteredFFT: fft of input image
    imgPcenteredFFT = fft2(imgPcentered);
end

