function a(filter1,filter2)
% this function is performing part 'a' of homework
% first read image and transform it to intesity image
% after that zero pad image and rotate filter 180 degree and call
% applyFilter function
% after that call matlab functions for applying these filters
% and finally plot them and plot difference and calculate absolute
% difference of them
% inputs: filter1 and filter2 : two designed 3*3 filter by user
% output: there is no output
    img = rgb2gray(imread('image.jpg'));
    
    height = size(img,1);
    width = size(img,2);
    zeroPadImg = zeros(height+4,width+4);
    for i=1:height
        for j=1:width
            zeroPadImg(i+2,j+2) = img(i,j);
        end
    end
    
    rotatedFilter1 = rotate180(filter1);
    rotatedFilter2 = rotate180(filter2);
    
    img2 = applyFilter(zeroPadImg , filter1);
    img3 = applyFilter(zeroPadImg , filter2);
    
    img2 = uint8(img2);
    img3 = uint8(img3);
    
    filterSum1 = 0;
    for i=1:3
        for j=1:3
            filterSum1 = filterSum1 + filter1(i,j);
        end
    end
    filterSum2 = 0;
    for i=1:3
        for j=1:3
            filterSum2 = filterSum2 + filter2(i,j);
        end
    end
    
    imgTemp = uint16(img);
    img4 = imfilter(imgTemp,filter1,'conv');
    img4 = img4 / filterSum1;
    img4 = uint8(img4);
    
    img5 = imfilter(imgTemp,filter2,'conv');
    img5 = img5 / filterSum2;
    img5 = uint8(img5);
    
        sum1 = 0;
    sum1 = uint32(sum1);

    for i=1:size(img2,1)      % calculate absolute value of pixel-wise
                                  % difference between output and original
        for j=1:size(img2,2)
            sum1 = sum1 + double(abs(img2(i,j)-img4(i,j)));
        end
    end

    sum2 = 0;
    sum2 = uint32(sum2);

    for i=1:size(img3,1)      % calculate absolute value of pixel-wise
                                  % difference between output and originals
        for j=1:size(img3,2)
            sum2 = sum2 + double(abs(img3(i,j)-img5(i,j)));
        end
    end
    
    figure;
    subplot(2,4,1);
    imshow(img);
    title('original image');
    
    subplot(2,4,2);
    imshow(img2);
    title('my apply filter 1');
    
    subplot(2,4,3);
    imshow(img4);
    title('matlab apply filter 1');
    
    subplot(2,4,4);
    imshow(imabsdiff(img2 , img4));
    title(sum1);

    subplot(2,4,5);
    imshow(img);
    title('original image');
    
    subplot(2,4,6);
    imshow(img3);
    title('my apply filter 2');
    
    subplot(2,4,7);
    imshow(img5);
    title('matlab apply filter 2');
    
    subplot(2,4,8);
    imshow(imabsdiff(img3 , img5));
    title(sum2);
 
end

