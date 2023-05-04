function unreduced = b(reduced)
% this function perform part "b" of question 1
% this function extend height and width of image by 200% with bilinear
% interpolation method
% inputs: reduced: size reduced image
% outputs: unreduced: size extend image
    unreduced = imresize(reduced,2,'bilinear');

end

