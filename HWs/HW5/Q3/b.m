function b(x,img)
% this function perform part 'b' of question 3
% this function first calculate mean and covariance of image vectors
% after that calculate eigen values and eigen vector
% then sort eigen vector base on eigen value
% after that calculate matrix A and finaly calculate transform function
% and at the end, plot 4 images base on book
% input: x:changed coordinate image based on hand make image , img:original hand make image
% output: there is no output
    x1 = x(:,1);
    x2 = x(:,2);
    Mx = mean(x);
    Cx = cov(x);
    [eigenVector,eigenValue] = eig(Cx);
    
    for i=1:size(eigenValue,1)
        for j=i+1:size(eigenValue,1)
            if eigenValue(i,i) < eigenValue(j,j)
                temp = eigenVector(i,:);
                eigenVector(i,:) = eigenVector(j,:);
                eigenVector(j,:) = temp(1,:) ;
            end
        end
    end
    
    for i=1:size(eigenValue,1)
        temp = eigenVector(i,1);
        eigenVector(i,1) = eigenVector(i,2);
        eigenVector(i,2) = temp;
    end
    
    A = eigenVector;
    
    MxCopy = zeros(size(x,1) , 2);
    
    for i=1:size(MxCopy,1)
        MxCopy(i,1) = Mx(1,1);
        MxCopy(i,2) = Mx(1,2);
    end
    
    y = round((x - MxCopy) * A);
    y1 = y(:,1) * -1;
    y2 = y(:,2);
    
    figure;
    subplot(2,2,1);
    swarmchart(x1,x2,'black');
    axis on;
    xlim([0 550]);
    ylim([0 550]);
    title('an object');
    
    subplot(2,2,2);
    swarmchart(x1,x2,'black');
    axis on;
    xlim([0 550]);
    ylim([0 550]);
    hold on;
    line([188 325],[223 360]);
    line([188 105],[223 380]);
    title('an object');
    
    
    subplot(2,2,3);
    axis on;
    axis([-400 400 -400 400]);
    line([0 0],[-400 400]);
    hold on;
    line([-400 400],[0 0]);
    swarmchart(y1,y2,'black');
    hold off;
    title('transformed object');
    
    minY1 = min(y1);
    minY2 = min(y2);
    
    y1 = y1 - minY1 + 50;
    y2 = y2 - minY2 + 50;
    subplot(2,2,4);
    swarmchart(y1,y2,'black');
    axis on;
    axis([0 500 0 500]);
    title('translated object');
                    
end

