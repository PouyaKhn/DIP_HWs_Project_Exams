%**************************************************************************
% this function normalize matrix X to [low high]                          *
%                                                                         *
% Inputs: X: original matrix                                              *
%         low: low value                                                  *
%         high: max value                                                 *
%                                                                         *
% output: output: normalized matrix to [low high]                         *
%**************************************************************************
function output =  normalize(X , low , high)
    X = X - min(min(X));
    output = low + (high-low)* X / max(max(X));
end

