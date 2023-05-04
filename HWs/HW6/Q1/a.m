%**************************************************************************
% This is 'a' function for part 'a' of question 1                         *
% In this function we add 4 pair spikes to fourie transform spectrum      *
%                                                                         *
% Inputs:  img: original image                                            *
%                                                                         *
% Outputs: noisyImage: periodic noisy image                               *
%**************************************************************************
function noisyImage = a(img)

    first = addNoise(img,0.3, 80 , 100);
    second = addNoise(first,0.3, 80 , -100);
    third = addNoise(second,0.3, sqrt(2)*60 , 0);
    noisyImage = addNoise(third,0.3, 0, sqrt(2)*150);
    
end

