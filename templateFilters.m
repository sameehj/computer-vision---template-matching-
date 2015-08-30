function [ filters,myAngels,sizes ] = templateFilters( template )
%TEMPLATEFILTERS 
% this function creates diffrent orientations of the template each with
% diffrent size 
angles=0:11.25:25;
index=1;
for i = 1:length(angles)
currentImgAngle=imrotate(template,angles(i));
    for j = 5:9
        filters{index}=imresize(currentImgAngle,j/15);
           %     figure;
        %imshow(filters{index});
        sizes{index}=j/15;
        myAngels(index)=angles(i);
        index=index+1;

    end
end



