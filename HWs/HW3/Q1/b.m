function b(filter1Vertical,filter1Horizontal,filter2Vertical,filter2Horizontal)
% this function is performing part 'b' of homework
% first read image
% after that zero pad image and rotate filter 180 degree and call
% applyFilter function
% after that call matlab functions for applying these filters
% and finally plot them and plot difference and calculate absolute
% difference of them
% inputs: 4 designed 3*3 filter by user that is vertical and horizontal
% part of sobel and prewitt filters
% output: there is no output
    img = imread('image.tif');
    
    height = size(img,1);
    width = size(img,2);
    zeroPadImg = zeros(height+4,width+4);
    for i=1:height                                  %zero padding image
        for j=1:width
            zeroPadImg(i+2,j+2) = img(i,j);
        end
    end
    
    rotatedFilter1Vertical = rotate180(filter1Vertical);
    rotatedFilter1Horizontal = rotate180(filter1Horizontal);
    rotatedFilter2Vertical = rotate180(filter2Vertical);
    rotatedFilter2Horizontal = rotate180(filter2Horizontal);
    
%     img21 = applyFilter(zeroPadImg , rotatedFilter1Vertical);
%     img22 = applyFilter(zeroPadImg , rotatedFilter1Horizontal);
%     
%     img31 = applyFilter(zeroPadImg , rotatedFilter2Vertical);
%     img32 = applyFilter(zeroPadImg , rotatedFilter2Horizontal);

img21 = conv2(double(zeroPadImg) , rotatedFilter1Vertical , 'same');
img22 = conv2(double(zeroPadImg) , rotatedFilter1Horizontal , 'same');
img31 = conv2(double(zeroPadImg) , rotatedFilter2Vertical , 'same'); 
img32 = conv2(double(zeroPadImg) , rotatedFilter2Horizontal , 'same');
    
    img21 = uint8(img21);
    img22 = uint8(img22);
    img31 = uint8(img31);
    img32 = uint8(img32);
    
    img2 = img21 + img22;    % cumulate horizontal and vericals
    img3 = img31 + img32;
    
    img2Temp = img2;
    img3Temp = img3;
    
    img2 = zeros(size(img2,1)-4,size(img2,2)-4);
    img3 = zeros(size(img3,1)-4,size(img3,2)-4);
    
    for i=1:(size(img2,1))
        for j=1:(size(img2,2))
            img2(i,j) = img2Temp(i+2,j+2);
        end
    end
    for i=1:(size(img3,1))
        for j=1:(size(img3,2))
            img3(i,j) = img3Temp(i+2,j+2);
        end
    end
    
    img2 = uint8(img2);
    img3 = uint8(img3);
    
    h1 = fspecial('sobel');
    h2 = fspecial('prewitt');
    img4 = imfilter(img,h1,'conv');
    img5 = imfilter(img,h2,'conv');
    
    

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
    title('my apply filter sobel');
    
    subplot(2,4,3);
    imshow(img4);
    title('matlab apply filter sobel');
    
    subplot(2,4,4);
    imshow(imabsdiff(img2 , img4));
    title(sum1);

    subplot(2,4,5);
    imshow(img);
    title('original image');
    
    subplot(2,4,6);
    imshow(img3);
    title('my apply filter prewitt');
    
    subplot(2,4,7);
    imshow(img5);
    title('matlab apply filter prewitt');
    
    subplot(2,4,8);
    imshow(imabsdiff(img3 , img5));
    title(sum2);
    
    

    
end

