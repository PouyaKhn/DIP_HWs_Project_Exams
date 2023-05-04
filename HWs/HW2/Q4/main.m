img = imread('image.tif');
figure
imhist(img);
original = img;

imSize = 0;
imSize= size(img,1)*size(img,2);
plot = makeFunction();  % GUI interface: draw a plot for specified histogram
c = createHist(plot,imSize);  % equalize original image using drawed histogram

frequency=zeros(256,1);
pf=zeros(256,1);
pc=zeros(256,1);
cum=zeros(256,1);
sum=0;

for i=1:size(img,1)      % calculate probability of occuring grey levels in
                         % original image matrix
    for j=1:size(img,2)
        value=img(i,j);
        frequency(value+1)=frequency(value+1)+1;
        pf(value+1)=frequency(value+1) / imSize;
    end
end
a = pf;

output=zeros(256,1);    % calculate probability of cumulative grey levels
for i=1:size(pf)
   sum=sum+frequency(i);
   cum(i)=sum;
   pc(i)=cum(i)/imSize;
   output(i)=round(pc(i)*255);
end
b = output;


index = zeros(256,1);
for i=0:255             % find output grey level for all grey levels
                        % based on specified histogram cumulative function
    minim = abs( double(b(i+1)) - double(c(1)) );
    index(i+1) = 0;
    for j=2:256
        if ( (abs( double(b(i+1)) - double(c(j)))) < minim )
            minim = abs( b(i+1) - c(j));
            index(i+1) = j-1;
        end
    end
end


for k=1:size(img,1)       % mapping all pixels of original image to
                          % calculated mapping vector
     for l=1:size(img,2)
           img(k,l) = index(original(k,l)+1);
     end
end

figure
subplot(2,2,1);
imshow(original);
title('original');
subplot(2,2,2);
imhist(original);
title('original hist');
subplot(2,2,3);
imshow(img);
title('hist matching');
subplot(2,2,4);
imhist(img);
title('hist matching hist');