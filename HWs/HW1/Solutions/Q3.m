ast = imread('ast.jpg');
imgHeight = size(ast, 1);
imgWidth = size(ast, 2);
figure
subplot(2,2,1);
imshow(ast);
title('original');
ast2 = imnoise(ast,'gaussian');
subplot(2,2,3);
imshow(ast2);
title('noisy');
subplot(2,2,2);
imhist(ast);
title('original hist');
subplot(2,2,4);
imhist(ast2);
title('noisy hist');

sum = zeros(imgHeight,imgWidth,3);

figure
for i=1:5
sum = sum + double(imnoise(ast,'gaussian'));
end
sum = sum/5;
sum = uint8(sum);
subplot(2,2,1);
imshow(sum);
title('5time averaging');
subplot(2,2,3);
imshow(ast2);
title('noisy');
subplot(2,2,2);
imhist(sum);
title('5time hist');
subplot(2,2,4);
imhist(ast2);
title('noisy hist');
sum = zeros(imgHeight,imgWidth,3);

figure
for i=1:10
sum = sum + double(imnoise(ast,'gaussian'));
end
sum = sum / 10;
sum = uint8(sum);
subplot(2,2,1);
imshow(sum);
title('10time averaging');
subplot(2,2,3);
imshow(ast2);
title('noisy');
subplot(2,2,2);
imhist(sum);
title('10time hist');
subplot(2,2,4);
imhist(ast2);
title('noisy hist');
sum = zeros(imgHeight,imgWidth,3);

figure
for i=1:50
sum = sum + double(imnoise(ast,'gaussian'));
end
sum = sum / 50;
sum = uint8(sum);
subplot(2,2,1);
imshow(sum);
title('50time averaging');
subplot(2,2,3);
imshow(ast2);
title('noisy');
subplot(2,2,2);
imhist(sum);
title('50time hist');
subplot(2,2,4);
imhist(ast2);
title('noisy hist');
sum = zeros(imgHeight,imgWidth,3);

figure
for i=1:100
sum = sum + double(imnoise(ast,'gaussian'));
end
sum = sum / 100;
sum = uint8(sum);
subplot(2,2,1);
imshow(sum);
title('100time averaging');
subplot(2,2,3);
imshow(ast2);
title('noisy');
subplot(2,2,2);
imhist(sum);
title('100time hist');
subplot(2,2,4);
imhist(ast2);
title('noisy hist');
