function output = alphaTrimmed(img,windowSize,alpha)
% function that apply alpha trimmed filter to image for noise removal
% inputs: img: noisy image , windowSize: mean filter window size
% alpha: percentage between 0 and 0.5 that show elements that must deleted
% outputs: output: noise remove image using alpha trimmed filter
    del = alpha * (windowSize ^ 2) ;
    if rem(round(del),2) == 1
        del = (round(del) - 1)/2;
    else
        del = (round(del))/2;
    end
    
    output = img;
    
    for i=1:(size(img,1))
        for j =1:(size(img,2))
                k = (windowSize - 1)/2;
                x1 = i-k;
                x2 = i+k;
                y1 = j-k;
                y2 = j+k;
                if i-k < 1
                    x1 = 1;
                end
                if i+k > size(img,1)
                    x2 = size(img,1);
                end
                if j-k < 1
                    y1 = 1;
                end
                if j+k > size(img,2)
                    y2 = size(img,2);
                end
                window = img(x1:x2 , y1:y2);
                window = window';
                window = window(:)';
                window = sort(window);
                windowNew = window(1+del : length(window)- del );
                output(i,j) = mean(windowNew);
        end
    end

end

