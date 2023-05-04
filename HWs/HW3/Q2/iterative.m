function output = iterative(img)
% this function apply iterative based median filter on noisy image
% inputs: img: noisy input image
% output: output: applied iterative median filter image that have less noise
    output = img;
    for i=1:(size(img,1))
        for j =1:(size(img,2))
            for m=3:2:17
                windowSize = m;
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
                med = median(window , [1 2]);
                if med == 0 || med == 255
                    continue;
                else
                    break;
                end
            end
            output(i,j) = med;
        end
    end
                  
end

