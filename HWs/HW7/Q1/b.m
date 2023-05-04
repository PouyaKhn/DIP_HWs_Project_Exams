%**************************************************************************
% This is 'b' function for part 'b' of question 1                         *
% In this function we first calculate frequency of all safe colors        *
% occurness in image pixels and find dominant color                       *
% then calculate distance of all colors from dominant one with specific   *
% distances that declare in program code. finally label to all pixels     *
% according to distances and give each label one specific color           *
%                                                                         *
% Inputs:  img: safe color image                                          *
%          original: original image                                       *
%                                                                         *
% Outputs: there is no output                                             *
%**************************************************************************
function b(img,original)
    img = double(img);
    safeColor = uint8(img);
    frequency = double(zeros(256,256,256));
    
    for i=1:size(img,1)
        for j=1:size(img,2)
            frequency(img(i,j,1)+1,img(i,j,2)+1,img(i,j,3)+1) = ...
                frequency(img(i,j,1)+1,img(i,j,2)+1,img(i,j,3)+1) + 1;
        end
    end
    
    [x,y,z] = ind2sub(size(frequency),find(frequency == max(max(max(frequency)))));
    
    color1 = [ x-1 ; y-1 ; z-1 ];
    
    label = zeros(size(img,1),size(img,2));
    distance = zeros(size(img,1),size(img,2));
    
    for i=1:size(img,1)
        for j=1:size(img,2)
            distance(i,j) = sqrt( (img(i,j,1)-color1(1))^2 + ...
                (img(i,j,2)-color1(2))^2 + ...
                (img(i,j,3)-color1(3))^2 );
        end
    end
    
    D1=0;
    D2=200;
    D3=300;
    
    for i=1:size(img,1)
        for j=1:size(img,2)
            if distance(i,j) == D1
                label(i,j) = 1;
                continue;
            elseif distance(i,j) > D1 && distance(i,j) <= D2
                label(i,j) = 2;
                continue;
            elseif distance(i,j) > D2 && distance(i,j) <= D3
                label(i,j) = 3;
                continue;
            else
                continue;
            end
        end
    end
    
    for i=1:size(label,1)
        for j=1:size(label,2)
            if label(i,j) == 1
                img(i,j,1) = 255;
                img(i,j,2) = 0;
                img(i,j,3) = 0;
                continue;
            elseif label(i,j) == 2
                img(i,j,1) = 0;
                img(i,j,2) = 255;
                img(i,j,3) = 0;
                continue;
            elseif label(i,j) == 3
                img(i,j,1) = 0;
                img(i,j,2) = 0;
                img(i,j,3) = 255;
                continue;
            else
                img(i,j,1) = 80;
                img(i,j,2) = 80;
                img(i,j,3) = 80;
                continue;
            end
        end
    end
    
    subplot(2,2,1);
    imshow(original,[]);
    title('original image');
    subplot(2,2,2);
    imshow(safeColor,[]);
    title('safe color converted');
    subplot(2,2,3.5);
    imshow(uint8(img),[]);
    title('red is color1(D=0), green is color2(0<D<D1),blue is color3(D1<D<D2) and grey is color4(D>D2)');
end

