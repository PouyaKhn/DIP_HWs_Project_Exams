%**************************************************************************
% This is 'distance' function for part a of question 2                    *
% In this function we calculate distance meshes in M*N matrix with        *
% Uk and Vk centers                                                       *
%                                                                         *
% Inputs:  M,N: space matrix                                              *
%          Uk and Vk: center of distance matrix                           *
%                                                                         *
% Outputs: Dk : distance matrix of result calculations                    *
%          Dl : symmetric matrix of Dk                                    *
%**************************************************************************
function [Dk,Dl] = distance(M,N,Uk,Vk)
        Dk = zeros(M,N);
        for u = 1:M
            for v = 1:N
                Dk(u,v) = sqrt((u-M/2-Uk).^2 + (v-N/2-Vk).^2 );
            end
        end
        Dl = zeros(M,N);
        for u = 1:M
            for v = 1:N
                Dl(u,v) = sqrt((u-M/2+Uk).^2 + (v-N/2+Vk).^2 );
            end
        end
end

