function [appliedFilter,H] = five(imgPcenteredFFT,P,Q)
% Generate a real, symmetric filter function, H(u,v), of size P*Q with center
% at coordinates (P/2, Q/2). Form the product G = H * F
% inputs: imgPcenteredFFT: fft of padded image that is center of frequency
% P and Q: size of padded image
% outputs: appliedFilter: output of applying filter to image,H: filter
    R=30;
    X=0:P-1;
    Y=0:Q-1;
    [X,Y] = meshgrid(X,Y);
    Cx=0.5*P;
    Cy=0.5*Q;
    H = exp(-((X-Cx).^2 +(Y-Cy).^2)./(2*R).^2);
    
    appliedFilter = H .* imgPcenteredFFT ;
    
end

