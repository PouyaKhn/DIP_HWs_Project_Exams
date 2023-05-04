function output = applyFilter(zeroPadImg , filter)
% this function apply 3*3 filter to zero padded image
% inputs: zeroPadImg:zero padded image, filter: 3*3 filter
% outputs: a filter applied image
filterSum = 0;
for i=1:3
    for j=1:3
        filterSum = filterSum + filter(i,j);
    end
end

height = size(zeroPadImg,1);
width = size(zeroPadImg,2);
newPadImage = zeros(height-2,width-2);
sum = 0;

for i=1:(height-2)
    for j=1:(width-2)
        
        for k=1:3
            for l=1:3
                sum = sum + ( filter(k,l) * zeroPadImg(i+k-1,j+l-1) );
            end
        end
        
        newPadImage(i,j) = sum / filterSum ; 
        sum = 0;
    end
end

output = zeros(height-4,width-4);

for i=1:(size(output,1))
    for j=1:(size(output,2))
        output(i,j) = newPadImage(i+1,j+1);
    end
end


end

