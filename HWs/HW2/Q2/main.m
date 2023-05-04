img1= imread('hist_eq1.tif');
img2= imread('hist_eq2.tif');

newHist1=uint8(zeros(size(img1,1),size(img1,2)));
newHist2=uint8(zeros(size(img2,1),size(img2,2)));

newHist1 = histogram_equalization(img1); % apply hist equalization to image
newHist2 = histogram_equalization(img2); % apply hist equalization to image

newHist1 = uint8(newHist1);
newHist2 = uint8(newHist2);


figure;

subplot(2,6,1);
imshow(img1);
title('original');
subplot(2,6,2);
imhist(img1);
title('original hist');

subplot(2,6,7);
imshow(img2);
title('original');
subplot(2,6,8);
imhist(img2);
title('original hist');

subplot(2,6,3);
imshow(newHist1);
title('my eq');
subplot(2,6,4);
imhist(newHist1);
title('my eq hist');

subplot(2,6,9);
imshow(newHist2);
title('my eq');
subplot(2,6,10);
imhist(newHist2);
title('my eq hist');

subplot(2,6,5);
x = histeq(img1);
imshow(x);
title('matlab eq');

subplot(2,6,11);
y = histeq(img2);
imshow(y);
title('matlab eq');

subplot(2,6,6);
imshow(imabsdiff(newHist1 , x));
title('difference');

subplot(2,6,12);
imshow(imabsdiff(newHist2 , y));
title('difference');

sum = 0;
sum = uint32(sum);

for i=1:size(newHist1,1)      % calculate absolute value of pixel-wise
                              % difference between output and original
    for j=1:size(newHist1,2)
        sum = sum + double(abs(newHist1(i,j)-x(i,j)));
    end
end
disp(sum);

sum = 0;
sum = uint32(sum);

for i=1:size(newHist2,1)      % calculate absolute value of pixel-wise
                              % difference between output and originals
    for j=1:size(newHist2,2)
        sum = sum + double(abs(newHist2(i,j)-y(i,j)));
    end
end
disp(sum);