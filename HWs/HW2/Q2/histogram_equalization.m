function newHist = histogram_equalization(img)
% this function equalize image's histogram
% input: img: grayscale image
% output: newHist: equalize greyscale image(histogram)
mySize= size(img,1)*size(img,2);

frequency=zeros(256,1);
pf=zeros(256,1);
pc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);
sum=0;

for i=1:size(img,1)   % calculate probability of occuring grey levels in 
                      % image matrix
    for j=1:size(img,2)
        
        value=img(i,j);
        frequency(value+1)=frequency(value+1)+1;
        pf(value+1)=frequency(value+1) / mySize;

    end
end

for i=1:size(pf)    % calculate probability of cumulative grey levels

   sum=sum+frequency(i);
   cum(i)=sum;
   pc(i)=cum(i)/mySize;
   output(i)=round(pc(i)*255);
   
end

for i=1:size(img,1)   % applying equalization to image and create new one
    for j=1:size(img,2)

            newHist(i,j)=output(img(i,j)+1);

    end
end

end