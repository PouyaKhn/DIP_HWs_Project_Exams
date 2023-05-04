%**************************************************************************
% This is 'g' function for part 'g' of question 3                         *
% In this function we calculare RMSE for DCT and FFT results and show them*
%                                                                         *
% Inputs:  resultFFT: result of coding image with FFT and decoding that   *
%          resultDCT: result of coding image with dct and decoding that   *
%          resized: resized image of original image                       *
% Outputs: there is no output                                             *
%**************************************************************************
function g(resized,resultDCT,resultFFT)
    sum = 0;
    
    for i=1:size(resized,1)
        for j=1:size(resized,2)
           sum = sum + (resultDCT(i,j) - double(resized(i,j)))^2 ;
        end
    end
    MN = size(resized,1) * size(resized,2);
    rmseDCT = sqrt( sum / MN );
    
    sum = 0;
    for i=1:size(resized,1)
        for j=1:size(resized,2)
           sum = sum + (real(resultFFT(i,j)) - double(resized(i,j)))^2 ;
        end
    end
    rmseFFT = sqrt( sum / MN );

    figure;
    subplot(2,3,1);
    imshow(resized,[]);
    title('original image');
    
    subplot(2,3,2);
    imshow(resultDCT,[]);
    title('DCT compression');
    
    subplot(2,3,3);
    imshow(real(resultFFT),[]);
    title('FFT compression');
    
    subplot(2,3,5);
    imshow(imabsdiff(double(resized),resultDCT),[]);
    title(strcat('Root mean square error: ',num2str(rmseDCT)));
    
    subplot(2,3,6);
    imshow(imabsdiff(double(resized),real(resultFFT)),[]);
    title(strcat('Root mean square error: ',num2str(rmseFFT)));

end

