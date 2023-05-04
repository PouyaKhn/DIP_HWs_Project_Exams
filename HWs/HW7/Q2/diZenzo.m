%**************************************************************************
% This is 'diZenzo' function for part 'a' of question 2                   *
% In this function we compute the vector gradient , VG , and corresponding* 
% angle array , VA , ( in radians ) of RGB image F . It also computes PPG,*
% the per - plane composite gradient obtained by summing the 2 - D        *
% gradients of the individual color planes                                *
%                                                                         *
% Inputs:  f: safe color image                                            *
%          T: threshold in the range [ O , 1 ]                            *
%                                                                         *
% Outputs: PPG: result of applying di-zenzo on all channels               *
%          RG,GG,BG: result of applying di-zenzo on channels              *
%**************************************************************************
function [ PPG , RG , GG , BG ] = diZenzo(f,T)

% Compute the x and y derivatives of the three component
% using Sobel operators
sh = fspecial('sobel');
sv =sh';
Rx = imfilter ( double(f(:,:,1)) , sh ,'replicate');
Ry = imfilter ( double(f(:,:,1)) , sv ,'replicate');
Gx = imfilter ( double(f(:,:,2)) , sh ,'replicate');
Gy = imfilter ( double(f(:,:,2)) , sv ,'replicate');
Bx = imfilter ( double(f(:,:,3)) , sh ,'replicate');
By = imfilter ( double(f(:,:,3)) , sv ,'replicate');
% Compute the parameters of the vector gradient .
gxx = Rx.^2 + Gx.^2 + Bx.^2 ;
gyy = Ry.^2 + Gy.^2 + By.^2 ;
gxy = Rx.*Ry + Gx.*Gy + Bx.*By ;
A = 0.5 * ( atan ( 2*gxy ./ ( gxx - gyy + eps ) ) ) ;
G1 = 0.5 * ( ( gxx + gyy ) + ( gxx - gyy ) .* cos(2*A) + 2*gxy .* sin(2*A) ) ;
% Now repeat for angle + pi / 2 . Then select the maximum at each point .
A = A + pi / 2 ;
G2 = 0.5* ( ( gxx + gyy ) + ( gxx - gyy ) .* cos(2*A) + 2*gxy .* sin(2*A) ) ;
G1 = G1 .^ 0.5 ;
G2 = G2 .^ 0.5 ;
% Form VG by picking the maximum at each ( x , y ) and then scale
% to the range [ O , 1 ] .
VG = mat2gray ( max (G1 , G2 ) ) ;
% Compute the per - plane gradients .
RG = sqrt ( Rx .^ 2 + Ry .^ 2 ) ;
GG = sqrt ( Gx .^ 2 + Gy .^ 2 ) ;
BG = sqrt ( Bx .^ 2 + By .^ 2 ) ;
% Form the composite by adding the individual results and
% scale to [ O, 1 ].
PPG = mat2gray ( RG + GG + BG ) ;
% Threshold the result .
if nargin == 2
    VG = ( VG > T ) .* VG ;
    PPG = ( PPG > T ) .* PPG ;
end

