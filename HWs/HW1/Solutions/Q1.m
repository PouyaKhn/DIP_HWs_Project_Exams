img = imread('picture.jpg');
img = rgb2gray(img);

img1200 = imresize(img,8.510);
img600 = imresize(img,4.255);
img300 = imresize(img,2.127);
img150 = imresize(img,1.063);
img75 = imresize(img,0.5319);

figure;

subplot(2,3,1);
imshow(img);
title('original');

subplot(2,3,2);
imshow(img1200);
title('1200dpi');

subplot(2,3,3);
imshow(img600);
title('600dpi');

subplot(2,3,4);
imshow(img300);
title('300dpi');

subplot(2,3,5);
imshow(img150);
title('150dpi');

subplot(2,3,6);
imshow(img75);
title('75dpi');

% imshow(img);
% title('1200dpi');
% print('img1200dpi','-dpng','-r1200');
% img2 = imread('img1200dpi.png');
% imshow(img2);
% 
% imshow(img);
% title('600dpi');
% print('img600dpi','-dpng','-r600');
% img2 = imread('img600dpi.png');
% imshow(img2);
% 
% imshow(img);
% title('300dpi');
% print('img300dpi','-dpng','-r300');
% img2 = imread('img300dpi.png');
% imshow(img2);
% 
% imshow(img);
% title('150dpi');
% print('img150dpi','-dpng','-r150');
% img2 = imread('img150dpi.png');
% imshow(img2);
% 
% imshow(img);
% title('75dpi');
% print('img75dpi','-dpng','-r75');
% img2 = imread('img75dpi.png');
% imshow(img2);
