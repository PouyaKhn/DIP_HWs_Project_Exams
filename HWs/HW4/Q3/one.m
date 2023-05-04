function [P,Q] = one(img)
% give an image and input from user P and Q that is size of padded image
% input: img:original image
% output: P and Q that is size of padded image
    M = size(img,1);
    N = size(img,2);
    
    P = double(input(strcat('Please insert P(M is ',num2str(M),'): ')));
    Q = double(input(strcat('Please insert Q(N is  ',num2str(N),'):  ')));
end

