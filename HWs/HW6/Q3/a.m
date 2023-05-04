%**************************************************************************
% This is 'a' function for part a of question 3                           *
% In this function first we scale image to [0,1]                          *
% then we produce 6 types of noises random numbers with addNoise funcion  *
% then we add this random numbers with appropriate PDFs to image          *
% then we remove this noises with suitable methods by removeNoise funcion *
% and finally we show all results                                         *
%                                                                         *
% Inputs:  img: original image                                            *
%                                                                         *
% Outputs: there is no outputs                                            *
%**************************************************************************
function a(img)
    height = size(img,1);
    width = size(img,2);
    
    img = double(img);
    imgTemp = img;
    for i=1:height
        for j=1:width
            if img(i,j) == min(min(imgTemp))
                img(i,j) = 0;
            elseif img(i,j) == max(max(imgTemp))
                img(i,j) = 0.7;
            else
                img(i,j) = 0.4;
            end
        end
    end
    
    gaussianNum = addNoise('gaussian',height,width,0.2,0.06);
    
    rayleighNum = addNoise('rayleigh',height,width,0.02,0.02);
    
    gammaNum = addNoise('gamma',height,width,20,2);
    
    exponentialNum = addNoise('exponential',height,width,15,2);    

    uniformNum = addNoise('uniform',height,width,0,0.25);
    
    saltpepperNum = addNoise('salt & pepper',height,width,0.08,0.05);
    
    %//////////////////////////////////////////////////////////////////////
    
    imgGaussian = img + gaussianNum;
    
    imgRayleigh = img + rayleighNum;

    imgGamma = img + gammaNum;

    imgExponential = img + exponentialNum;
    
    imgUniform = img + uniformNum;
    
    imgSaltPepper = img;
    for i=1:height
        for j=1:width
            if saltpepperNum(i,j) == 0
                imgSaltPepper(i,j) = 0;
            elseif saltpepperNum(i,j) == 1
                imgSaltPepper(i,j) = 1;
            else
                continue;
            end
        end
    end
 
%//////////////////////////////////////////////////////////////////////////

imgGaussianRestore = removeNoise(imgGaussian,'gmean',9,9);

imgRayleighRestore = removeNoise(imgRayleigh,'gmean',11,11);

imgGammaRestore = removeNoise(imgGamma,'gmean',11,11);

imgExponentialRestore = removeNoise(imgExponential,'min',5,5);

imgUniformRestore = removeNoise(imgUniform , 'midpoint',5,5);

imgSaltPepperRestore = removeNoise(imgSaltPepper ,'median' ,3,3);

%///////////////////////////////////////////////////////////////////////////

figure;
subplot(4,2,1);
imshow(imgGaussian,[]);
title('apply gaussian');
subplot(4,2,2);
imshow(imgRayleigh,[]);
title('apply rayleigh');
subplot(4,2,3);
imhist(imgGaussian);
title('apply gaussian hist');
subplot(4,2,4);
imhist(imgRayleigh);
title('apply rayleigh hist');
subplot(4,2,5);
imshow(real(imgGaussianRestore),[]);
title('gaussian restore');
subplot(4,2,6);
imshow(imgRayleighRestore,[]);
title('rayleigh restore');
subplot(4,2,7);
imhist(real(imgGaussianRestore));
title('gaussian restore hist');
axis([0 1 0 5000]);
subplot(4,2,8);
imhist(imgRayleighRestore);
title('rayleigh restore hist');
axis([0 1 0 6500]);

figure;
subplot(4,2,1);
imshow(imgGamma,[]);
title('apply Gamma');
subplot(4,2,2);
imshow(imgExponential,[]);
title('apply Exponential');
subplot(4,2,3);
imhist(imgGamma);
title('apply Gamma hist');
subplot(4,2,4);
imhist(imgExponential);
title('apply Exponential hist');
axis([0 1 0 1600]);
subplot(4,2,5);
imshow(imgGammaRestore,[]);
title('Gamma restore');
subplot(4,2,6);
imshow(imgExponentialRestore,[]);
title('Exponential restore');
subplot(4,2,7);
imhist(imgGammaRestore);
title('Gamma restore hist');
axis([0 1 0 7000]);
subplot(4,2,8);
imhist(imgExponentialRestore);
title('Exponential restore hist');
axis([0 1 0 20000]);

figure;
subplot(4,2,1);
imshow(imgUniform,[]);
title('apply Uniform');
subplot(4,2,2);
imshow(imgSaltPepper,[]);
title('apply SaltPepper');
subplot(4,2,3);
imhist(imgUniform);
title('apply Uniform hist');
subplot(4,2,4);
imhist(imgSaltPepper);
title('apply SaltPepper hist');
axis([-0.1 1.1 0 30000]);
subplot(4,2,5);
imshow(imgUniformRestore,[]);
title('Uniform restore');
subplot(4,2,6);
imshow(imgSaltPepperRestore,[]);
title('SaltPepper restore');
subplot(4,2,7);
imhist(imgUniformRestore);
title('Uniform restore hist');
axis([0 1 0 10000]);
subplot(4,2,8);
imhist(imgSaltPepperRestore);
title('SaltPepper restore hist');
axis([-0.1 1.1 0 40000]);

    
end

