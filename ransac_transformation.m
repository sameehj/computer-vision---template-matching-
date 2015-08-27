function [transformedTemplate,tform]=ransac_transformation(points1,points2,templateImg,destinationImage,iterations,threshhold)

% maxInliers=0;
% F=0;
% inliersIndex=0;
% inputSize=length(points1);
% P1=[points1(:,1) points1(:,2) ones(inputSize,1)];
% P2=[points2(:,1) points2(:,2) ones(inputSize,1)];
% for i=1:iterations
%     chosenPoints=randperm(inputSize);
%     tempF=estimateGeometricTransform(points1(chosenPoints(1:8),:),points2(chosenPoints(1:8),:),'projective');
%     % transform points from points 1 to 2
%     transformedTemplate=imwarp(templateImg,tempF);
%     figure;
%     imshow(transformedTemplate);
%     inliers=false(inputSize,1);
%     for j=1:inputSize
%         if abs(P1(j,:)'*tempF-P2(j,:))<threshhold
%             inliers(j)=1;
%         end
%     end
%     % find inliers and outliers
%     x=sum(inliers);
%     if(x>maxInliers)
%         F=tempF;
%         maxInliers=x
%         inliersIndex=inliers;
%    end
% end
% 
    try
    [tform,inlierpoints1,inlierpoints2,status]=estimateGeometricTransform(points1,points2,'projective', 'MaxNumTrials' ,iterations,'MaxDistance',threshhold );
    [transformedTemplate,status]=imwarp(templateImg,tform);
    %figure;
   % imshow(transformedTemplate);
    catch ME
        switch ME.identifier
            case 'MATLAB:scriptNotAFunction'
            otherwise
                transformedTemplate=[];
                tform=[];
                    warning('Problem using function.  Assigning a value of 0.');
            
        end
        
    end


end