function c = createHist(plot,imSize)
% this function first round X axis of drawed plot for better calculations
% then find all Y axis values for all [0,255] grey levels base on drawed
% plot that user created. then scale all Y axis values to normalized
% values that summation of all of them is equal to original image size
% then draw 256 lines base on Y normalized values
% then calculate probability of cumulative function from drawed histogram
% inputs: plot: drawed plot by user , imsize: size of original image(pixel)
% output: c: cumulative function of specified histogram
    
    for i=1:length(plot.p.XData)
        plot.p.XData(i) = uint8(round(plot.p.XData(i)));
    end
    
    newY = zeros(1,256);
    newX = [double(0):double(255)];
    
    for i=1:256
        if (i-1 < plot.p.XData(1)) || (i-1 > plot.p.XData(length(plot.p.XData)))
            newY(i) = 0;
        else
            for k = 1:( length(plot.p.XData) - 1 )
                if  ( (plot.p.XData(k) <= i-1 ) && ( i-1 <= plot.p.XData(k+1)) )
                    a = (plot.p.YData(k+1) - plot.p.YData(k)) / (plot.p.XData(k+1) - plot.p.XData(k));

                    b = plot.p.YData(k) - (a*plot.p.XData(k));

                    newY(i) = round(a*(i-1) + b);
                end
            end
        end
    end
    nesbat = zeros(1,256);
    sumAll = 0;
    for i=1:length(newY)
        sumAll = sumAll + newY(i);
    end
    for i=1:length(newY)
        nesbat(i) = newY(i) / sumAll ;
    end
    for i=1:length(newY)
        newY(i) = round(double(nesbat(i) * imSize)) ;
    end
    figure;
    title('this is your creative histogram');
    axis([0 255 0 65000]);
    xlabel('grey level');
    ylabel('frequency');
    
    for i=1:256
        temp = [ newX(i) , newX(i) ];
        temp2 = [ 0 , newY(i) ];
        line(temp,temp2);
    end
    
    mySize = 0;
    for i=1:length(newY)
        mySize = mySize + newY(i);
    end
    
    pf=zeros(256,1);
    for i=1:length(newY)
        pf(i) = newY(i) / mySize;
    end
    
    sum = 0;
    pc=zeros(256,1);
    cum=zeros(256,1);
    output=zeros(256,1);
    for i=1:256
       sum=sum+newY(i);
       cum(i)=sum;
       pc(i)=cum(i)/mySize;
       output(i)=round(pc(i)*255);
    end
    c = output;
end