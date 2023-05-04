function filter = a(img , lambdaL , lambdaH  , c , D0)
% this function perform part 'a' of question 1
% this function create homomorphic filter based on lambdaL and lambdaH and
% c and D0 values
% input: img: original image, lambdaL and lambdaH: lambda values in
% homomorphic filter, c: sharpening degree, D0: cutoff frequency
% outputs: filter: homomorphic filter that we created
    filter = zeros(2 * size(img,1),2 * size(img,2));
    M = size(filter ,1);
    N = size(filter ,2);
    D = zeros(2 * size(img,1),2 * size(img,2));
    for i = 1:M
        for j = 1:N
            D(i,j) = sqrt((i-M/2).^2 + (j-N/2).^2 );
        end
    end
    filter = (lambdaH - lambdaL) * (1 - exp(-c * (D .^2 ./ D0.^2))) + lambdaL;
end

