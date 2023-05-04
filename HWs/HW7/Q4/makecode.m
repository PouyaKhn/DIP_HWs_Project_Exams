%**************************************************************************
% This is 'makecode' function for part 'b' of question 4                  *
% In this function we calculate each code from coding tree                *
%                                                                         *
% Inputs: sc: coding source tree                                          *
%         codeword: string of resulted code word                          *
%                                                                         *
% Outputs: there is no output                                             *
%**************************************************************************
function makecode(sc,codeword)
    global Code
    
    if isa(sc,'cell')
        makecode(sc{1} , [codeword 0]);
        makecode(sc{2} , [codeword 1]);
    else
        Code{sc} = char('0' + codeword);
    end
end

