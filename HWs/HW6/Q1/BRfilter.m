%**************************************************************************
% This is 'BRfilter' function for part 'b' of question 1                  *
% In this function we create a btw BR filter                              *
%                                                                         *
% Inputs:  img: original image                                            *
%          radius: cut-off frequency                                      *
%                                                                         *
% Outputs: BR: band reject filter                                         *
%**************************************************************************
function BR = BRfilter(img,radius)

    M = size(img ,1);
    N = size(img ,2);
    D = zeros(M,N);
    BR = zeros(M,N);
    for i = 1:M
        for j = 1:N
            D(i,j) = sqrt((i-M/2).^2 + (j-N/2).^2 );
        end
    end
    
    w=50;
    n=2;
    BR = 1 ./ ( 1 + ((D .* w)./((D .^ 2) - (radius .^ 2))).^ (2*n));
end

