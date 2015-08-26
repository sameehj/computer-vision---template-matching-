function [ im_out ] = grabcut_function( img , rectangle, gamma )
%GRABCUT_FUNCTION Summary of this function goes here
%   Detailed explanation goes here
%cropped = imcrop(img,rectangle);
try
im_out = grabcut(img, gamma,rectangle);
   catch ME
        switch ME.identifier
            case 'MATLAB:scriptNotAFunction'
            otherwise
                    im_out=[];
                    warning('Problem using function.  Assigning a value of 0.');
            
        end
end

