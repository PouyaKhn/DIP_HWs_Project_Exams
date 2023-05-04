clear all;
clc;
img = imread('image.tif');
img = double(img);
imgP = zeros(size(img,1)*2 , size(img,2)*2 );
for i=1:size(img,1)
    for j=1:size(img,2)
        imgP(i,j) = img(i,j);
    end
end
imgPcentered = double(imgP);
for i=1:size(imgP,1)
    for j=1:size(imgP,2)
        imgPcentered(i,j) = imgP(i,j) .* ((-1).^(i+j));
    end
end
imgPcenteredFFT = fft2(imgPcentered);
P = ((real(imgPcenteredFFT)).^2) + ((imag(imgPcenteredFFT)).^2) ;
PT = double(0);
for i=1:size(P,1)
    for j=1:size(P,2)
        PT = PT + P(i,j);
    end
end

[Hideal , Hbtw, Hgaussian,D0] = a(80,2,size(imgP,1),size(imgP,2),PT,P);
b(Hideal,Hbtw,Hgaussian,imgPcentered,img,D0);
[Hideal , Hbtw, Hgaussian,D0] = a(90,2,size(imgP,1),size(imgP,2),PT,P);
b(Hideal,Hbtw,Hgaussian,imgPcentered,img,D0);
[Hideal , Hbtw, Hgaussian,D0] = a(95,2,size(imgP,1),size(imgP,2),PT,P);
b(Hideal,Hbtw,Hgaussian,imgPcentered,img,D0);



