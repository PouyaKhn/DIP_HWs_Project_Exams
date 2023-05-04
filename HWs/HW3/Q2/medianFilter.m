function output = medianFilter(noisy,window)
% this function apply matlab median filter with window size
% inputs: noisy: noisy image, window: number that show window size
% output: output: applied median filter image that have less noise
    output = medfilt2(noisy,[window window],'zeros');
end

