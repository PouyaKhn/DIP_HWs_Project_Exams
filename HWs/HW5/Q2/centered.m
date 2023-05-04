function resultImage = centered(inputImage)
% this function centered image to center of frequency
% input: inputImage: a not centered image that we want make center
% output: resultImage: centered image
    resultImage = inputImage;
    for i = 1:size(resultImage,1)
        for j =1:size(resultImage,2)
            resultImage(i,j) = resultImage(i,j) * (-1)^(i+j);
        end
    end
end

