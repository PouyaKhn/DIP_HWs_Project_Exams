function b(img,plots,eq)
% this function do home work's part "b"
% first calculate correlate Y Value of every 0~255 grey levels of every
% input functions and after that transform grey levels and show them
% inputs: img: original greylevel image, plots: struct that store functions
% , eq: histogram equalized image
% outputs: there is no outputs
    newY1 = zeros(1,256);
    newY2 = zeros(1,256);
    newY3 = zeros(1,256);
    for i=1:256
        if (i-1 < plots.input1.p.XData(1)) || (i-1 > ...
                plots.input1.p.XData(length(plots.input1.p.XData)))
            newY1(i) = 0;
        else
            for k = 1:( length(plots.input1.p.XData) - 1 )
                if  ( (plots.input1.p.XData(k) <= i-1 ) && ...
                        ( i-1 <= plots.input1.p.XData(k+1)) )
                    a = (plots.input1.p.YData(k+1) - plots.input1.p.YData(k))...
                        / (plots.input1.p.XData(k+1) - plots.input1.p.XData(k));

                    b = plots.input1.p.YData(k) - (a*plots.input1.p.XData(k));

                    newY1(i) = a*(i-1) + b;
                end
            end
        end
    end
    
    for i=1:256
        if (i-1 < plots.input2.p.XData(1)) || (i-1 > ...
                plots.input2.p.XData(length(plots.input2.p.XData)))
            newY2(i) = 0;
        else
            for k = 1:( length(plots.input2.p.XData) - 1 )
                if  ( (plots.input2.p.XData(k) <= i-1 ) && ...
                        ( i-1 <= plots.input2.p.XData(k+1)) )
                    a = (plots.input2.p.YData(k+1) - plots.input2.p.YData(k))...
                        / (plots.input2.p.XData(k+1) - plots.input2.p.XData(k));

                    b = plots.input2.p.YData(k) - (a*plots.input2.p.XData(k));

                    newY2(i) = a*(i-1) + b;
                end
            end
        end
    end
    
    for i=1:256
        if (i-1 < plots.input3.p.XData(1)) || (i-1 > ...
                plots.input3.p.XData(length(plots.input3.p.XData)))
            newY3(i) = 0;
        else
            for k = 1:( length(plots.input3.p.XData) - 1 )
                if  ( (plots.input3.p.XData(k) <= i-1 ) && ...
                        ( i-1 <= plots.input3.p.XData(k+1)) )
                    a = (plots.input3.p.YData(k+1) - plots.input3.p.YData(k))...
                        / (plots.input3.p.XData(k+1) - plots.input3.p.XData(k));

                    b = plots.input3.p.YData(k) - (a*plots.input3.p.XData(k));

                    newY3(i) = a*(i-1) + b;
                end
            end
        end
    end
    
    output = zeros(size(img,1),size(img,2));
    for i=1:size(img,1)
        for j=1:size(img,2)
           output(i,j) = ( ( newY1( img(i,j)+1 ) * plots.output1.p.XData(1) ) ...
               + ( newY2( img(i,j)+1 ) * plots.output2.p.XData(1) ) ...
               + ( newY3( img(i,j)+1 ) * plots.output3.p.XData(1) ) ) ...
               / ( newY1( img(i,j)+1 ) + newY2( img(i,j)+1 ) + newY3( img(i,j)+1 ) );
        end
    end
    output = uint8(output);
    
    figure;
    subplot(1,3,1);
    imshow(img);
    title('original image');
    
    subplot(1,3,2);
    imshow(eq);
    title('histogram eq image');
    
    subplot(1,3,3);
    imshow(output);
    title('fuzzy enhance image');
    
    figure;
    subplot(1,3,1);
    imhist(img);
    title('original image hist');
    subplot(1,3,2);
    imhist(eq);
    title('equalization histogram');
    subplot(1,3,3);
    imhist(output);
    title('fuzzy enhance hist');
end

