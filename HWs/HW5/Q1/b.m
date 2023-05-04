function b(img,filter,lambdaL,lambdaH)
% this function perform part 'b' of question 1
% this function zero pad original image and centerize it and apply
% homomorphic filter to it and show results
% inputs: img: original image, filter: homomorphic filter that we created
% outputs: there is no outputs
    imageHeight = size(img ,1);
    imageWidth = size(img ,2);
    imgZP = zeros( 2 * size(img,1) , 2 * size(img,2) );
    imgZP(1:imageHeight,1:imageWidth) = img;
    
    imgLog = log(imgZP + 1);
    
    imgCentered = imgLog;
    for i = 1:size(imgCentered,1)
        for j =1:size(imgCentered,2)
            imgCentered(i,j) = imgCentered(i,j) .* (-1).^(i+j);
        end
    end
    
    imgCenteredFFT = fft2(imgCentered);
    
    applyFilter =  imgCenteredFFT .* filter;
    
    result = ifft2(applyFilter);
    resultCentered = result;
    for i = 1:size(resultCentered,1)
        for j =1:size(resultCentered,2)
            resultCentered(i,j) = resultCentered(i,j) .* (-1).^(i+j);
        end
    end
    resultFinal = exp(resultCentered) - 1;
    
    output = resultFinal(1:size(img,1) , 1:size(img,2));
    output = abs(output);

    figure;
    subplot(1,2,1);
    imshow(img , []);
    title('original image');

    subplot(1,2,2);
    imshow(output , []);
    title(strcat('lambdaL:',num2str(lambdaL),',lambdaH:',num2str(lambdaH)));

end

