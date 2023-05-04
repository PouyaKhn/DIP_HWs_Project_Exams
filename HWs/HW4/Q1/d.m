function d(img,reduced,unreduced,reducedMean,unreducedMean)
% this function perform part "d" of question 1
% this function show all output images in part a & b & c
% inputs: img: original image,reduced:size reduced image
%         unreduced: size extend image, reducedMean: size reduced image with mean filter
%         unreducedMean: size extend image with mean filter
% outputs: there is no output
    figure;
    subplot(2,3,1);
    imshow(img);
    title('original');
    subplot(2,3,2);
    imshow(reduced);
    title('simple reduced');
    subplot(2,3,3);
    imshow(unreduced);
    title('simple unreduced');
    subplot(2,3,4);
    imshow(img);
    title('original');
    subplot(2,3,5);
    imshow(reducedMean);
    title('mean reduced');
    subplot(2,3,6);
    imshow(unreducedMean);
    title('mean unreduced');
end

