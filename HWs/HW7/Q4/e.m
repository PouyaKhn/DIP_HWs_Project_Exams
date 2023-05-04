%**************************************************************************
% This is 'e' function for part 'e' of question 4                         *
% we Compute the entropy of original and compressed image                 *
%                                                                         *
% Inputs: fHat: linear prediction coding result                           *
%         code: coded image                                               *
%                                                                         *
% Outputs: there is no output                                             *
%**************************************************************************
function e(fHat,code)
minf = min(fHat(:));
maxf = max(fHat(:));
fHat = fHat(:)';
hist1 = histc(fHat,minf:maxf);

minc = min(code.code(:));
maxc = max(code.code(:));
hist2 = histc(code.code , minc:maxc);
hist2(hist2 == 0) = [];


p1 = zeros(size(hist1,2),1);
p2 = zeros(size(hist2,2),1);

sum1 = sum(hist1);
sum2 = sum(hist2);
for i=1:size(p1,1)
    p1(i) = hist1(i) / sum1 ;
end
for i=1:size(p2,1)
    p2(i) = hist2(i) / sum2 ;
end

entropy1 = 0;
for i=0:size(p1,1)-1
    entropy1 = entropy1 + (p1(i+1)* log2(p1(i+1)));
end
entropy1 = -entropy1;

entropy2 = 0;
for i=0:size(p2,1)-1
    entropy2 = entropy2 + (p2(i+1)* log2(p2(i+1)));
end
entropy2 = -entropy2;

display(strcat('entropy of original image is: ',num2str(entropy1)));
display(strcat('entropy of compressed image is: ',num2str(entropy2)));
end

