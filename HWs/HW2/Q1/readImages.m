function readImages(plots) %this function read 2 image and converting to grey image and apply
                           %tranform functions to them and show them in figure
                           %input: plots: that are 2 plots that user drawed
                           %output: there is no output
img1 = rgb2gray(imread('img1.jpg'));
img2 = rgb2gray(imread('img2.jpg'));
img1Height = size(img1,1);
img1Width = size(img1,2);
img2Height = size(img2,1);
img2Width = size(img2,2);

new1 = zeros(img1Height,img1Width);
for i = 1:img1Height               % applying transform functions to images
    for j = 1:img1Width
        for k = 1:( size(plots.plot1.p.XData,2) - 1 )
            if  ( (plots.plot1.p.XData(k) <= double(img1(i,j))) && ...
                    (double(img1(i,j)<= plots.plot1.p.XData(k+1))) )

                a = (plots.plot1.p.YData(k+1) - plots.plot1.p.YData(k))/ ...
                     (plots.plot1.p.XData(k+1)-plots.plot1.p.XData(k));
                 
                b = plots.plot1.p.YData(k) - (a*plots.plot1.p.XData(k));
                
                new1(i,j) = a * double(img1(i,j)) + b ;
                
            end
        end
    end
end

new2 = zeros(img2Height,img2Width);
for i = 1:img2Height
    for j = 1:img2Width
        for k = 1:( size(plots.plot2.p.XData,2) - 1 )
            if  ( (plots.plot2.p.XData(k) <= double(img2(i,j))) && ...
                    (double(img2(i,j)<= plots.plot2.p.XData(k+1))) )

                a = (plots.plot2.p.YData(k+1) - plots.plot2.p.YData(k))/ ...
                     (plots.plot2.p.XData(k+1)-plots.plot2.p.XData(k));
                 
                b = plots.plot2.p.YData(k) - (a*plots.plot2.p.XData(k));
                
                new2(i,j) = a * double(img2(i,j)) + b ;
                
            end
        end
    end
end

new1 = uint8(new1);
new2 = uint8(new2);

figure;
imshow(img1);
figure;
imshow(new1);
figure;
imshow(img2);
figure;
imshow(new2);

end