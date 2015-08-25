%% load configurations from configurations.m file
configurations;
%% sift images
    [templateFrames,templateDescriptors] = sift((rgb2gray(template)/255), 'Verbosity', 1);

for i = 1:size(images,1)
    [frames{i},descriptors{i}] = sift((rgb2gray(seq{i})/255), 'Verbosity', 1);
end



%% match descriptors for each pair
for i=1:length(images)
    matches{i} = (siftmatch(templateDescriptors, descriptors{i}));
    figure;
    showMatches(double(template)/255,double(seq{i})/255,templateFrames,frames{i},matches{i});
end

%%
for i=1:length(images)
    if(size(matches{i},2)>10)
    [transformed,tForm]=ransac_transformation(templateFrames(1:2,matches{i}(1,:))',frames{i}(1:2,matches{i}(2,:))',template,seq{i},10000,1.5);
   if (~isempty(transformed))
    RGB= insertShape(seq{i},'Rectangle', [transformPointsForward(tForm,[0 0]) size(transformed,2) size(transformed,1)]);
    figure;
    imshow(RGB);
   end

    end
end
