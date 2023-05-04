%**************************************************************************
% this function adding noise base on percentage that user entered         *
% inputs:img: greyscale input image, percentage: input percentage of noise*
% output:output: noisy image                                              *
%**************************************************************************
function output = addNoise(img,percentage)

output = img ;
percentage = double(percentage);

imageSize = size(img,1) * size(img,2);
percentageSize = round((percentage/100) * imageSize) ;

for i=1:percentageSize
    
    x = randi([1 size(img,1)],1);
    y = randi([1 size(img,2)],1);
    sORp = randi([0 1],1);
    
    if sORp == 0
        output(x,y) = 0;
    else
        output(x,y) = 255;
    end
    
end
    
end

