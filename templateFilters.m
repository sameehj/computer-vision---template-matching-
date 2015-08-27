function [ filters ] = templateFilters( template )
%TEMPLATEFILTERS 
% this function creates diffrent orientations of the template each with
% diffrent size 
angles=0:11.25:337.5;
index=1;
for i = 1:length(angles)
currentImgAngle=imrotate(template,angles(i));
    for j = 9:17
        filters{index}=imresize(currentImgAngle,j/10);
        index=index+1;
    end
end



