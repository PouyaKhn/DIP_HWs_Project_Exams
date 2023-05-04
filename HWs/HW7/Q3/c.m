%**************************************************************************
% This is 'c' function for part 'c' of question 3                         *
% In this function we declare a mask to save 15 most important coeficients*
%                                                                         *
% Inputs:  there is no input                                              *
% Outputs: maskDCT: created mask                                          *
%**************************************************************************
function maskDCT = c()
    maskDCT = [ 1 1 1 1 1 0 0 0 ;
                1 1 1 1 0 0 0 0 ;
                1 1 1 0 0 0 0 0 ;
                1 1 0 0 0 0 0 0 ;
                1 0 0 0 0 0 0 0 ;
                0 0 0 0 0 0 0 0 ;
                0 0 0 0 0 0 0 0 ;
                0 0 0 0 0 0 0 0 ];
end

