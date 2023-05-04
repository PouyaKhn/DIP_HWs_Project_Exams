function c(img,transformed,rotated)
% this function perform part 'c' of question 2
% this function calculate fft of original and rotated and transform images
% this function plot phase of this 3 images
% inputs: rotated: rotated image, transformed: transformed image,
% img:original image
% outputs: there is no output
    normalSpectrum = fft2(img);
    transSpectrum = fft2(transformed);
    rotateSpectrum = fft2(rotated);
    
    normalPhase= angle(normalSpectrum);
    transPhase = angle(transSpectrum);
    rotatePhase = angle(rotateSpectrum);
    
    figure;
    subplot(1,3,1);
    imshow(normalPhase,[]);
    title('normal phase');
    subplot(1,3,2);
    imshow(transPhase,[]);
    title('translated phase');
    subplot(1,3,3);
    imshow(rotatePhase,[]);
    title('rotated phase');
end

