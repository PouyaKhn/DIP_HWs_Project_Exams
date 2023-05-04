function imgPcentered = three(imgP)
% Multiply Fp(x,y) by (-1)^(x+y) to center its transform
% inputs: imgP: padded image
% outputs: imgPcentered: padded image that is center of frequency
    imgPcentered = double(imgP);
    for i=1:size(imgP,1)
        for j=1:size(imgP,2)
            imgPcentered(i,j) = imgP(i,j) .* ((-1) .^ (i+j));
        end
    end
end

