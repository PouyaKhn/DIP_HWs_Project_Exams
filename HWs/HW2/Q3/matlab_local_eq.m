function eq = matlab_local_eq(img,window)
% this function zero padding image for making original image suitable
% for local histogram equalization(using official matlab instruction
% with given size of window
% input: img:greyscale image , window: n that show n*n window size
% output: equalize(local) greyscale image
window = uint16(window);
eq = zeros( size(img,1) , size(img,2) );
k = uint16((window - 1)/2);
height = uint16(0);
width = uint16(0);
height = size(img,1);
width = size(img,2);
zPad = zeros(height+2*k,width+2*k);

for i=uint16(1):height
    for j=uint16(1):width
        zPad(i+k,j+k) = img(i,j);
    end
end
for i=uint16(1+k):(k+height)
    for j=uint16(1+k):(k+width)
        new = zPad( ((i-k):(i-k+ 2*k)) , ((j-k):j-k+ 2*k ));
        new = uint8(new);
        new = histeq(new);
        eq(i-k,j-k) = new(1+k,1+k);
    end
end

end

