function final = seven(finalP,img)
% Obtain the final processed result, g(x, y), by extracting the M*N region
% from the top, left quadrant of Gp(x,y)
% inputs: finalP: padded output, img: original image
% outputs: final: unpadded output
    M = size(img,1);
    N = size(img,2);
    final = zeros(M,N);
    for i=1:M
        for j=1:N
            final(i,j) = finalP(i,j);
        end
    end
    
end

