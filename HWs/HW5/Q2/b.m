function b(noisyImage,image)
% this function perform part 'b' of question 2
% this function first show original and noisy image(part a)
% then show noisy Image spectrum(normalized)
% then save this spectrum and edit it(notch filter creation) in paint
% then save edited spectrum as notch filter applied to spectrum
% then calculate original spectrum(backwarding)
% then show image with backward spectrum and noisy image phase
% and finaly show result image
% input: noisyImage: sine applied noisy image, image: original image
% output: there is no outputs
    noisyImageSpectrum = abs(fft2(centered(noisyImage)));

    subplot(2,3,1);
    imshow(image , []);
    title("original Image")
    subplot(2,3,2);
    imshow(noisyImage , []);
    title("Noisy Image")
    subplot(2,3,3);
    noisyImageSpectrumNormal = uint8(normalize(log10(noisyImageSpectrum + 1) , 0 , 255));
    % imwrite(noisyImageSpectrumNormal,"noisyImageSpectrumNormal.tif");
    imshow(noisyImageSpectrumNormal);
    title("Spectrum of Noisy Image")
    
    noisyImageSpectrumNormalEdited = ...
        double(rgb2gray(imread("noisyImageSpectrumNormalEdited.jpg")));
    
    backward = (10*ones(size(image))) .^ ...
        normalize(noisyImageSpectrumNormalEdited ...
        , min(min(log10(noisyImageSpectrum+1))) , max(max(log10(noisyImageSpectrum+1))));
    
    result = centered(ifft2(backward .* exp(1i*angle(fft2(centered(noisyImage))))));

    subplot(2,4,6);
    imshow(noisyImageSpectrumNormalEdited , []);
    title("Noise Removed Spectrum")

    subplot(2,4,7);
    imshow(real(result) , []);
    title("Noise Removed Image")
end

