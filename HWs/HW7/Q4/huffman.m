%**************************************************************************
% This is 'huffman' function for part 'b' of question 4                   *
% this function code image pixels as a vector using huffman method        *
%                                                                         *
% Inputs: p: vector that must code with 0 and 1 string values             *
%                                                                         *
% Outputs: Code: result of coding all pixels of image with huffman method *
%**************************************************************************
function Code = huffman(p)
    global Code
    
    Code = cell(length(p),1);
    
    if length(p) > 1
        p = p / sum(p);
        s = reduce(p);
        makecode(s,[]);
    else
        Code = {'1'};
    end
    
end

