window = uint8(input('please input n that create n*n window size: '));
img = imread('image.tif');

eq1 = matlab_local_eq(img,window);  % applying official matlab instruction
                                    % for local histogram equalization
                                    % to image with given size of window
eq1 = uint8(eq1);
eq2 = my_local_eq(img,window);     % applying my matlab instructions
                                   % for local histogram equalization
                                   % to image with given size of window
eq2 = uint8(eq2);

figure;

subplot(1,3,1);
imshow(img);
title('original image');

subplot(1,3,2);
imshow(eq1);
title('local eq with matlab eq func');

subplot(1,3,3);
imshow(eq2);
title('local eq with my eq func');