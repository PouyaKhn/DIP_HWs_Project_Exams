function reduced = a(img)
% this function perform part "a" of question 1
% this function reduced height and width of image by 50% with removing
% row and column method
% inputs: img: original image
% outputs: reduced: size reduced image
    
    height = size(img,1);
    width = size(img,2);
    
    reducedHeight = height / 2;
    reducedWidth = width / 2;
    
    reduced = zeros(reducedHeight,reducedWidth);
    for i=1:reducedHeight
        for j=1:reducedWidth
            reduced(i,j) = img( (1+ (i-1)*2) , (1+ (j-1)*2) );
        end
    end
    
    reduced = uint8(reduced);
end

