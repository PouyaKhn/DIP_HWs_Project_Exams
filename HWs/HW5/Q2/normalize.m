function output =  normalize(X , low , high)
% this function normalize matrix X to [low high]
% input: X: original matrix, low: low value, high: max value
% output: output: normalized matrix to [low high]
    X = X - min(min(X));
    output = low + (high-low)* X / max(max(X));
end

