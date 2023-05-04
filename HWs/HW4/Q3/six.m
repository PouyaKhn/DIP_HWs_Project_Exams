function finalP = six(appliedFilter)
% this function inverse fourie transform on appliedfilter input
% and make it center of matrix
% inputs: appliedFilter: output of applying filter to image
% outputs: finalP: padded output
     finalPtemp = ifft2(appliedFilter);
     finalP = double(finalPtemp);
     for i=1:size(finalPtemp,1)
         for j=1:size(finalPtemp,2)
             finalP(i,j) = finalPtemp(i,j) .* ((-1) .^ (i+j));
         end
     end
     
end

