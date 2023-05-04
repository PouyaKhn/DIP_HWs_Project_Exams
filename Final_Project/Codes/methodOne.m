%**************************************************************************
% this function apply method one to noisy image                           *
% first apply 2 times med filter to it with max size of window 9          *
% finally apply median filter with infinity max size of window with       *
% assumption of: apply filter to noise pixels only                        *
% inputs:img: noisy input image                                           *
% output:iterativeOutput3: result of applying iterative med filter twice  *
% with max size of window 9 and one time with infinity size onto noise    *
% pixels only                                                             *
%**************************************************************************
function iterativeOutput3 = methodOne(noisyImage)
iterativeOutput = iterative(noisyImage,9);
iterativeOutput = uint8(iterativeOutput);

iterativeOutput2 = iterative(iterativeOutput,9);
iterativeOutput2 = uint8(iterativeOutput2);

iterativeOutput3 = iterative2(iterativeOutput2,999);
iterativeOutput3 = uint8(iterativeOutput3);
end

