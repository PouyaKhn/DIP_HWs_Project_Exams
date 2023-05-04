%**************************************************************************
% This is 'addPeriodicNoise' function for part a of question 2            *
% In this function first we proccess inputs                               *
% then we produce periodic noise pattern and calculate this spectrum      *
%                                                                         *
% Inputs:  M,N: size of noise pattern                                     *
%          C: spikes place matrix                                         *
%          A,B: noise parameters
%                                                                         *
% Outputs: r: noise pattern in spatial domain                             *
%          R: fourie transform of r                                       *
%          S: spectrum of R                                               *
%**************************************************************************
function [r,R,S] = addPeriodicNoise(M,N,C,A,B)
    K = size(C,1);
    if nargin == 3
        A(1:K) = 1.0;
        B(1:K , 1:2) = 0;
    elseif nargin == 4
        B(1:K , 1:2) = 0;
    end
    
    R = zeros(M,N);
    for j=1:K
        u1 = M/2 + 1 + C(j,1);
        v1 = N/2 + 1 + C(j,2);
        R(u1,v1) = 1i * (A(j)/2) * exp(1i*2*pi*C(j,1) * B(j,1)/M);
        
        u2 = M/2 + 1 - C(j,1);
        v2 = N/2 + 1 - C(j,2);
        R(u2,v2) = -1i * (A(j)/2) * exp(1i*2*pi*C(j,1) * B(j,2)/N);
    end
    
    S = abs(R);
    r = real(ifft2(ifftshift(R)));
end

