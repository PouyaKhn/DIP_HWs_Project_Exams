function a(img)
% this function perform part 'a' of question 2
% this function compute fft and centered fft and log of fft of original image
% and show them in plots
% inputs: img: original image
% outputs: there is no output
    normalSpectrum = fft2(double(img));
    
    img2 = double(img);
    for i=1:size(img2,1)
        for j=1:size(img2,2)
            img2(i,j) = img2(i,j) * (-1)^(i+j);
        end
    end
    centeredSpectrum = fft2(double(img2));
    
    img3 = im2double(centeredSpectrum);
    logT = 40*log(1+img3);
    
    figure;
    subplot(2,2,1);
    imagesc(img);
    title('original');
    subplot(2,2,2);
    imagesc(abs(normalSpectrum));
    title('spectrum');
    subplot(2,2,3);
    imagesc(abs(centeredSpectrum));
    title('centered spectrum');
    subplot(2,2,4);
    imagesc(abs(logT));
    title('log transform spectrum'); 
end

