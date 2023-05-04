function imgP = two(img,P,Q)
% Form a padded image, of size by appending the necessary
% number of zeros to (x, y).
% input: img:original image, P and Q: size of padded image
imgP = zeros(P,Q);

for i=1:size(img,1)
    for j=1:size(img,2)
        imgP(i,j) = img(i,j);
    end
end
end

