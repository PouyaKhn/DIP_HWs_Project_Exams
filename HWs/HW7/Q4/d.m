%**************************************************************************
% This is 'd' function for part 'd' of question 4                         *
% In this function we showing results and difference of them              *
%                                                                         *
% Inputs: fHat: linear prediction coding result                           *
%         decode: decoded image                                           *
%                                                                         *
% Outputs: there is no output                                             *
%**************************************************************************
function d(fHat , decode)
    figure;
    subplot(1,3,1);
    imshow(fHat,[]);
    title("original fHat");
    
    subplot(1,3,2);
    imshow(decode,[]);
    title("encode and decode fHat");
   
    subplot(1,3,3);
    imshow(imabsdiff(fHat,decode),[]);
    title('diff between both');
end

