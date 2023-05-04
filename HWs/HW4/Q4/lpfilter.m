function H = lpfilter(type,M,N,D0,n)
% this function create 1 of 3 filters based on inputs
% inputs: type: type of filter, M and N: size of meshgrid
% D0: radii from center, n: order of btw
% outputs: H: filter created
    [U,V] = dftuv(M,N);
    
    D = sqrt(U.^2 + V.^2);
    
    switch type
        case 'ideal'
            H = double(D <= D0);
        case 'btw'
            if nargin == 4
                n=1;
            end
            H = 1./(1+(D./D0).^(2*n));
        case 'gaussian'
            H = exp(-(D.^2)./(2*(D0^2)));
        otherwise
            error('Unknown filter type.');
    end
    
end

