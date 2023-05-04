%**************************************************************************
% This is 'a' function for part 'a' of question 4                         *
% In this function we calculate f^ image and using that for calculation   *
% of prediction error and plot results with their histograms              *
%                                                                         *
% Inputs:  img: original image                                            *
%                                                                         *
% Outputs: fHat: linear prediction coding result                          *
%**************************************************************************
function fHat = a(img)
    f = double(img);
    fHat = f;

    for i=1:size(img,1)
        for j=2:size(img,2)
            fHat(i,j) = round(f(i,j-1));
        end
    end

    err = zeros(size(f,1),size(f,2));
    for i=1:size(f,1)
        for j=1:size(f,2)
            err(i,j) = f(i,j) - fHat(i,j);
        end
    end
    err2 = err;
    stdev = std2(err);
    mine = min(err(:));
    maxe = max(err(:));
    err = err(:)';
    histE = histc(err,mine:maxe);
    histE(histE == 0) = [];
    p = zeros(size(histE,2),1);
    sumE = sum(histE);
    for i=1:size(p,1)
        p(i) = histE(i) / sumE ;
    end
    entropyE = 0;
    for i=0:size(p,1)-1
        entropyE = entropyE + (p(i+1)* log2(p(i+1)));
    end
    en = -entropyE;
    

    figure;
    subplot(2,2,1);
    imshow(f,[]);
    subplot(2,2,2);
    histogram(uint8(f),10000);
    axis([0 300 0 2500]);
    subplot(2,2,3);
    imshow(err2,[]);
    subplot(2,2,4);
    histogram(err);
    axis([-300 300 0 20000]);
    sentence = {['Std. dev. = ',num2str(stdev)],['Entropy = ',num2str(en)]};
    annotation('textbox', [0.745, 0.25, 0.1, 0.1], 'String', sentence , 'FitBoxToText' , 'on');
end

