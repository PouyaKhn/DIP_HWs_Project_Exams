%**************************************************************************
% This is 'centered' function for all parts of question 1                 *
% In this function we centerize image to center of frequency domain       *
%                                                                         *
% Inputs:  inputImage: a not centered image that we want make center      *
%                                                                         *
% Outputs: resultImage: centered image                                    *
%**************************************************************************
function resultImage = centered(inputImage)

    resultImage = inputImage;
    for i = 1:size(resultImage,1)
        for j =1:size(resultImage,2)
            resultImage(i,j) = resultImage(i,j) * (-1)^(i+j);
        end
    end
end

