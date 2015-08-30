function [ videoFrame ] = insertImage( videoFrame,replacement, rectangle,size,angel,color )
%INSERTIMAGE Summary of this function goes here
%   Detailed explanation goes here
    replacement=imrotate(replacement,angel);
    replacement=imresize(replacement,size);
    toleranceOfColorDetectedForChange = 100;

    replacement = change1colorOnRGBToAnother(replacement, toleranceOfColorDetectedForChange, 'white', color);


    videoFrame(rectangle(2):(rectangle(4)+rectangle(2)-1),rectangle(1):(rectangle(3)+rectangle(1)-1),:)=replacement;
end

