function [Hideal , Hbtw, Hgaussian, D0] = a(B,n,p,q,PT,P)
% this function calculate D0 based on retain power spectrum
% and create filters based on this D0 and other parameters
% inputs: B: retain power spectrun, n: order of btw, p and q: size of
% padded image, PT: sum of all elements of power spectrum of image
% P: power spectrum of image
% outputs: Hideal: ideal filter, Hbtw:butterworth filter, Hgaussian:
% gaussian filter, D0: calculated D0 based on retain power spectrum
    
    centerX = size(P,1) / 2;
    centerY = size(P,2) / 2;
    
    for i=0:(p/2)
        summ = sum(sum( P(centerX-i:centerX+i,centerY-i:centerY+i) ));
        if ((summ/PT)*100) <= B
            continue;
        else
            break;
        end
    end
    D0 = i;
    
    Hideal = lpfilter('ideal',p,q,D0,n);
    Hbtw = lpfilter('btw',p,q,D0,n);
    Hgaussian = lpfilter('gaussian',p,q,D0,n);

end

