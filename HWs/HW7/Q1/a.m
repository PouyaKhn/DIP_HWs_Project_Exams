%**************************************************************************
% This is 'a' function for part 'a' of question 1                         *
% In this function we first calculate absolute distance value between     *
% pixels and safe colors, then convert colors to nearest one              *
%                                                                         *
% Inputs:  img: original image                                            *
%                                                                         *
% Outputs: safeColor: converted image to safe colors                      *
%**************************************************************************
function safeColor = a(img)   
    for i=1:size(img,1)
        for j=1:size(img,2)
            tempR = zeros(6,1);
            tempG = zeros(6,1);
            tempB = zeros(6,1);
            
            tempR(1) = abs(img(i,j,1) - 0);
            tempR(2) = abs(img(i,j,1) - 51);
            tempR(3) = abs(img(i,j,1) - 102);
            tempR(4) = abs(img(i,j,1) - 153);
            tempR(5) = abs(img(i,j,1) - 194);
            tempR(6) = abs(img(i,j,1) - 255);
            if min(tempR) == tempR(1)
                img(i,j,1) = 0;
            elseif min(tempR) == tempR(2)
                img(i,j,1) = 51;
            elseif min(tempR) == tempR(3)
                img(i,j,1) = 102;
            elseif min(tempR) == tempR(4)
                img(i,j,1) = 153;
            elseif min(tempR) == tempR(5)
                img(i,j,1) = 194;
            elseif min(tempR) == tempR(6)
                img(i,j,1) = 255;
            end
            
            tempG(1) = abs(img(i,j,2) - 0);
            tempG(2) = abs(img(i,j,2) - 51);
            tempG(3) = abs(img(i,j,2) - 102);
            tempG(4) = abs(img(i,j,2) - 153);
            tempG(5) = abs(img(i,j,2) - 194);
            tempG(6) = abs(img(i,j,2) - 255);
            if min(tempG) == tempG(1)
                img(i,j,2) = 0;
            elseif min(tempG) == tempG(2)
                img(i,j,2) = 51;
            elseif min(tempG) == tempG(3)
                img(i,j,2) = 102;
            elseif min(tempG) == tempG(4)
                img(i,j,2) = 153;
            elseif min(tempG) == tempG(5)
                img(i,j,2) = 194;
            elseif min(tempG) == tempG(6)
                img(i,j,2) = 255;
            end
            
            tempB(1) = abs(img(i,j,3) - 0);
            tempB(2) = abs(img(i,j,3) - 51);
            tempB(3) = abs(img(i,j,3) - 102);
            tempB(4) = abs(img(i,j,3) - 153);
            tempB(5) = abs(img(i,j,3) - 194);
            tempB(6) = abs(img(i,j,3) - 255);
            if min(tempB) == tempB(1)
                img(i,j,3) = 0;
            elseif min(tempB) == tempB(2)
                img(i,j,3) = 51;
            elseif min(tempB) == tempB(3)
                img(i,j,3) = 102;
            elseif min(tempB) == tempB(4)
                img(i,j,3) = 153;
            elseif min(tempB) == tempB(5)
                img(i,j,3) = 194;
            elseif min(tempB) == tempB(6)
                img(i,j,3) = 255;
            end
            
        end
    end
    safeColor = img;
end

