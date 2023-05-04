function noisyImage = a(img)
% this function perform part 'a' of question 2
% this function create preiodic sine noise and apply it to image
% input: img: original image that is not noisy
% output: noisyImage: noisy Image base on original image and sine noise
    sineFilter = zeros(size(img));
    for x = 1:size(img,1)
        for y = 1:size(img,2)
            sineFilter(x,y) = (sin(5*x+6*y) + sin(8*x+9*y)) / 10;
        end
    end
    noisyImage = img + sineFilter;    
end
