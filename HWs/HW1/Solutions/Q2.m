gray = rgb2gray(imread('picture.jpg'));
new = zeros(512,512);
gray2 = imresize(gray,[3072 5120]);       %resize 3280*4928 for better calculation
i=1;
j=1;
k=1;
l=1;
while k <= 3067
while l <= 5111
new(i,j) = mean(mean(gray2([k k+5],[l l+9])));
l = l+10;
j = j+1;
end
k = k + 6;
l = 1;
j = 1;
i = i+1;
end

new = uint8(new);
figure;
imshow(new, [0 255]);
title('256 level');

height = size(new,1);
width = size(new,2);

new128 = new;
for i=1:height
for j=1:width
new128(i,j) = round(double(new(i,j))/256 *128);
end
end
figure;
imshow(new128,[0 127]);
title('128 level');

new64 = new;
for i=1:height
for j=1:width
new64(i,j) = round(double(new(i,j))/256 *64);
end
end
figure
imshow(new64, [0 63]);
title('64 level');

new32 = new;
for i=1:height
for j=1:width
new32(i,j) = round(double(new(i,j))/256 *32);
end
end
figure;
imshow(new32, [0 31]);
title('32 level');

new2 = new;
for i=1:height
for j=1:width
new2(i,j) = round(double(new(i,j))/256 *2);
end
end
figure;
imshow(new2, [0 1]);
title('2 level');