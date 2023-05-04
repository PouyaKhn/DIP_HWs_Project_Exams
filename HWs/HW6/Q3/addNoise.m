%**************************************************************************
% This is addNoise function for part a of question 3                      *
% In this function first we process inputs with nargin value              *
% then we produce 6 types of noises random numbers with PDF formulas      *
%                                                                         *
% Inputs:  type: noise type                                               *
%          M and N: size of distribution random numbers                   *
%          a and b: distribution's PDFs parameters                        *
%                                                                         *
% Outputs: R: random numbers suitable for that noise type                 *
%**************************************************************************
function R = addNoise(type,M,N,a,b)
    if nargin == 1
        a = 0; b=1;
        M=1;N=1;
    elseif nargin == 3
        a=0;b=1;
    end
    
    switch type
        case 'uniform'
            R = a + (b-a)*rand(M,N);
        case 'gaussian'
            R = a + b*randn(M,N);
        case 'salt & pepper'
            if nargin <= 3
                a = 0.05; b=0.05;
            end
            if (a+b) > 1
                error('The sum Pa+Pb must not exeed 1.');
            end
            R(1:M,1:N) = 0.5;
            X = rand(M,N);
            c = find(X <= a);
            R(c) = 0;
            u = a+b;
            c = find(X > a & X<=u);
            R(c) = 1;
            
        case 'rayleigh'
            R = a + (-b*log(1- rand(M,N))).^ 0.5;
        case 'exponential'
            if nargin <= 3
                a = 1;
            end
            if a<=0
                error('Parameter a must be positive for exponential type.');
            end
            k = -1/a;
            R = k*log(1 - rand(M,N));
            
        case 'gamma'
            if nargin <= 3
                a = 2; b=5;
            end
            if b ~= round(b) || b <= 0
                error('Param b must be a positive integer for gamma');
            end
            k = -1/a;
            R = zeros(M,N);
            for j=1:b
                R = R + k*log(1 - rand(M,N));
            end
        otherwise
            error('Unknown distribution type');
    end

end

