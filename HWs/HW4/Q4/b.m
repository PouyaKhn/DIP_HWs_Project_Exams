function b(Hideal,Hbtw,Hgaussian,imgPcentered,img,D0)
% this function apply filters to image and unpadding and show them
% inputs: Hideal: ideal filter, Hbtw:butterworth filter, Hgaussian:
% gaussian filter, D0: calculated D0 based on retain power spectrum, 
% img: original image
% outputs: there is no output
    imgPcenteredFFT = fft2(imgPcentered);

    Hideal = fftshift(Hideal);
    Hbtw = fftshift(Hbtw);
    Hgaussian = fftshift(Hgaussian);
    
    appliedHideal = Hideal .* imgPcenteredFFT;
    appliedHbtw = Hbtw .* imgPcenteredFFT;
    appliedHgaussian = Hgaussian .* imgPcenteredFFT;
    
    realPartIdeal = real(ifft2(appliedHideal));
    finalPIdeal = double(realPartIdeal);
    for i=1:size(realPartIdeal,1)
         for j=1:size(realPartIdeal,2)
             finalPIdeal(i,j) = realPartIdeal(i,j) .* ((-1).^(i+j));
         end
    end
    M = size(img,1);
    N = size(img,2);
    finalIdeal = zeros(M,N);
    for i=1:M
        for j=1:N
            finalIdeal(i,j) = finalPIdeal(i,j);
        end
    end
    
    realPartBtw = real(ifft2(appliedHbtw));
    finalPBtw = double(realPartBtw);
    for i=1:size(realPartBtw,1)
         for j=1:size(realPartBtw,2)
             finalPBtw(i,j) = realPartBtw(i,j) .* ((-1).^(i+j));
         end
    end
    finalBtw = zeros(M,N);
    for i=1:M
        for j=1:N
            finalBtw(i,j) = finalPBtw(i,j);
        end
    end
    
    realPartGaussian = real(ifft2(appliedHgaussian));
    finalPGaussian = double(realPartGaussian);
    for i=1:size(realPartGaussian,1)
         for j=1:size(realPartGaussian,2)
             finalPGaussian(i,j) = realPartGaussian(i,j) .* ((-1).^(i+j));
         end
    end
    finalGaussian = zeros(M,N);
    for i=1:M
        for j=1:N
            finalGaussian(i,j) = finalPGaussian(i,j);
        end
    end
    
    
    figure;
    subplot(2,4,1);
    imshow(img,[]);
    title('original');
    
    subplot(2,4,2);
    imshow(finalIdeal,[]);
    title(strcat('ideal D0=',num2str(D0)));
    
    subplot(2,4,3);
    imshow(finalBtw,[]);
    title(strcat('Btw D0=',num2str(D0),' order:',num2str(2)));
    
    subplot(2,4,4);
    imshow(finalGaussian,[]);
    title(strcat('Gaussian D0=',num2str(D0)));
    
    subplot(2,4,6);
    imshow(imabsdiff(img , abs(finalIdeal)),[]);
    title('diff ideal');
    
    subplot(2,4,7);
    imshow(imabsdiff(img , abs(finalBtw)),[]);
    title('diff btw');
    
    subplot(2,4,8);
    imshow(imabsdiff(img , abs(finalGaussian)),[]);
    title('diff gaussian');
    
end

