%**************************************************************************
% this function apply method two to noisy image                           *
% inputs:img: noisy input image                                           *
%        original: original image without noise                           *
% output:output: noise removed image result                               *
%**************************************************************************
function output = methodTwo(img,original)
    output = img;
    P = zeros(256,1);    % vector for probability distribution of pixels
    frequency=zeros(256,1);  % vector for frequency of pixles
    mySize = size(original,1) * size(original,2);
    for i=1:size(original,1)   % calculating probability of pixels
        for j=1:size(original,2)
            value=img(i,j);
            frequency(value+1)=frequency(value+1)+1;
            P(value+1)=frequency(value+1) / mySize;
        end
    end
    m = 0;
    for i=1:256   % calculating weighted mean of all pixels
        m = m + ((i-1)*P(i));
    end
    vari = 0;
    for i=1:256     % calculating variance of image pixels
        vari = vari + (((i-1)-m)^2 * P(i));
    end
    previo = zeros(size(img,1)*size(img,2) , 1);   % vector for previous replacements
    t=1;
        for i=1:(size(img,1))
            for j =1:(size(img,2))
                for m=3:2:5
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
                    window = window / 4;
                    Gmax = double(max(max(window)));
                    Gmin = double(min(min(window)));
                    if img(i,j) > Gmin && img(i,j) < Gmax  % it is not noisy pixel
                        final = img(i,j) / 4;
                        break;
                    else
                        if m==3   % size of window 3
                            check = 0;
                            final = -1;
                            for v = 1:size(window,1)
                                for w = 1:size(window,2)
                                    if window(v,w) == Gmin || window(v,w) == Gmax % if it is noisy pixel
                                        continue;
                                    elseif check == 0   % all pixels in window is not noisy pixels
                                        final = window(v,w);
                                        check = 1;
                                        continue;
                                    else
                                        continue;
                                    end
                                end
                            end
                            
                            if final == -1   % increase window size
                                continue;
                            else
                                break;
                            end
                        else
                            temp = 0;
                            for v = 1:size(window,1)
                                for w = 1:size(window,2)
                                    if window(v,w) == Gmin || window(v,w) == Gmax
                                        continue;
                                    else
                                        temp = 1;
                                    end
                                end
                            end
                            if temp == 0    % all window is noisy pixels
                                if t-3 < 1 && t-2 >= 1
                                    final = mean(previo(t-2:t-1));
                                    break;
                                elseif t-3 < 1 && t-2 < 1 && t-1 >= 1
                                    final = previo(t-1);
                                    break;
                                elseif t-3 < 1 && t-2 < 1 && t-1 < 1
                                    final = img(i,j) / 4;
                                    break;
                                else
                                    final = mean(previo(t-3:t-1));
                                    break;
                                end
                            else   % all window pixels not noisy
                                avg = mean(mean(window));
                                med = median(window , [1 2]);
                                alpha = abs(Gmax + Gmin - 2*avg);
                                beta = abs(Gmax + Gmin - 2*med);
                                if alpha < beta
                                    final = avg;
                                else
                                    final = med;
                                end
                                
                                threshold = (100 / (sqrt((sqrt(vari))...
                                    /30)) ) - 40;
                                
                                if abs(double(final) - double(img(i,j) / 4)) <= threshold
                                    final = img(i,j) / 4;
                                    break;
                                else
                                    break;
                                end
                             end
                        end
                    end
                end
                previo(t) = double(final);
                t = t + 1;
                final = uint8(final * 4);
                output(i,j) = final; 
            end
        end
end

