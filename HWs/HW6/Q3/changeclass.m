%**************************************************************************
% This is changeclass function for part a of question 3                   *
% In this function we change image image class                            *
%                                                                         *
% Inputs:  class: destination class                                       *
%          varargin: source image class                                   *
%                                                                         *
% Outputs: image: converted image                                         *
%**************************************************************************
function image = changeclass(class, varargin)

switch class
case 'uint8'
   image = im2uint8(varargin{:});
case 'uint16'
   image = im2uint16(varargin{:});
case 'double'
   image = im2double(varargin{:});
otherwise
   error('Unsupported IPT data class.');
end

