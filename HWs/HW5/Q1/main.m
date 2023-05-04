img = double(imread("image.tif"));

filter = a(img , 0.5 , 2 , 1 , 80);

b(img,filter,0.5,2);


