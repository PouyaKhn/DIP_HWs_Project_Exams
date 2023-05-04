%**************************************************************************
% this function is removeNoise function for part a of question 2          *
% this function produce all type of filters for noise removal methods     *                                 *
%                                                                         *
% Inputs: g: noisy image                                                  *
%         type: noise removal method type                                 *
%         m and n: size of appropriate filter for noise remove            *
%                                                                         *
% output: f: noise removed image                                          *
%**************************************************************************
function f = removeNoise(g,type,m,n)
 
    switch type
        case 'amean'
            w = fspecial('average',[m n]);
            f = imfilter(g,w,'replicate');
        case 'gmean'
            inclass = class(g);
            g = im2double(g);
            warning off;
            f = exp(imfilter(log(g), ones(m,n) , 'replicate')).^(1/m/n);
            warning on;
            f = changeclass(inclass,f);
        case 'median'
            f = medfilt2(g , [m n],'symmetric');
        case 'min'
            f = ordfilt2(g, 1, ones(m,n), 'symmetric');
        case 'max'
            f = ordfilt2(g, m*n, ones(m,n), 'symmetric');
        case 'midpoint'
            f1 = ordfilt2(g, 1, ones(m,n), 'symmetric');
            f2 = ordfilt2(g,m*n,ones(m,n),'symmetric');
            f = imlincomb(0.5,f1,0.5,f2);
        otherwise
            error('Unknown filter type');
    end

end

