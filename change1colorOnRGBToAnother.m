function rgbImageModified = change1colorOnRGBToAnother(rgbImage, toleranceOfColorDetectedForChange, FromColor, ToColor)
%CHANGE1COLORONRGBTOANOTHER

[rowSize colSize numberOfRGB_planes] = size(rgbImage);

redPlane = rgbImage(:,:,1);
greenPlane = rgbImage(:,:,2);
bluePlane = rgbImage(:,:,3);


% [colors observed may not be of absolute values, tolerance range required]
% tolerance = 100;
tolerance = toleranceOfColorDetectedForChange;

    % default: 'black'
    redPlaneToBeChanged = 0:tolerance;
    greenPlaneToBeChanged = 0:tolerance;
    bluePlaneToBeChanged = 0:tolerance;
    
    valueRange = (255-tolerance):255;

%%%%%%%%%%%%%%%%%% From This Color
switch lower(FromColor)
   case {'red', 'r'}
    % Assign red to the thresholded part.
    redPlaneToBeChanged = valueRange;

   case {'blue', 'b'}
    bluePlaneToBeChanged = valueRange;
    
   case {'green', 'g'}
    greenPlaneToBeChanged = valueRange;

   case {'white', 'w'}
    redPlaneToBeChanged = valueRange;
    greenPlaneToBeChanged = valueRange;
    bluePlaneToBeChanged = valueRange;

   case {'yellow', 'y'}
    redPlaneToBeChanged = valueRange;
    greenPlaneToBeChanged = valueRange;
    
   case 'black'
       
   otherwise
      disp('Unknown color.')
end

%%%%%%%%%%%%%%%%%% To This Color
    % default: 'black'
    redPlaneToBeMappedTo = 0;
    greenPlaneToBeMappedTo = 0;
    bluePlaneToBeMappedTo = 0;

switch lower(ToColor)
   case {'red', 'r'}
    % Assign red to the thresholded part.
    redPlaneToBeMappedTo = 255;

   case {'blue', 'b'}
    bluePlaneToBeMappedTo = 255;
    
   case {'green', 'g'}
    greenPlaneToBeMappedTo = 255;

   case {'white', 'w'}
    redPlaneToBeMappedTo = 255;
    greenPlaneToBeMappedTo = 255;
    bluePlaneToBeMappedTo = 255;

   case {'yellow', 'y'}
    redPlaneToBeMappedTo = 255;
    greenPlaneToBeMappedTo = 255;
    
   case 'black'
       
   otherwise
      disp('Unknown color.')
end
%%%%%%%%%%%%%%%%%%%%%%%% START Chnaging the colors

for i = 1:rowSize
    for j = 1:colSize
        if (    sum( redPlane(i,j) == redPlaneToBeChanged) && ...
                sum( greenPlane(i,j) == greenPlaneToBeChanged) && ...
                sum( bluePlane(i,j) == bluePlaneToBeChanged) ...
            )
            redPlane(i,j) = redPlaneToBeMappedTo;
            greenPlane(i,j) = greenPlaneToBeMappedTo;
            bluePlane(i,j) = bluePlaneToBeMappedTo;
        end
    end    
end

%%%%%%%%%%%%%%%%%%%%%

% Make a color version of the image
rgbImageModified = cat(3, redPlane, greenPlane, bluePlane);
% imshow(rgbImageModified, []);

end

