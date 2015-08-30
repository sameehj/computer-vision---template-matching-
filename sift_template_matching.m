%% load configurations from configurations.m file
configurations;

%% sift images

template=imresize(template,0.2);

[templateFrames,templateDescriptors] = sift((rgb2gray(template)/255), 'Verbosity', 1);

for i = 1:size(images,1)
    [frames{i},descriptors{i}] = sift((rgb2gray(seq{i})/255), 'Verbosity', 1);
end



%% match descriptors for each pair
for i=1:length(images)
    matches{i} = (siftmatch(templateDescriptors, descriptors{i}));
    %figure;
    %showMatches(double(template)/255,double(seq{i})/255,templateFrames,frames{i},matches{i});
end

%%
for i=1:length(images)
    if(size(matches{i},2)>10)
        [transformed,tForm]=ransac_transformation(templateFrames(1:2,matches{i}(1,:))',frames{i}(1:2,matches{i}(2,:))',template,seq{i},10000,0.5);
        if (~isempty(transformed))
            rectangle=[transformPointsForward(tForm,[0 0]) size(transformed,2) size(transformed,1)];
            RGB= insertShape((seq{i}),'Rectangle', rectangle);
            figure;
            subplot(1,2,1);
            imshow(RGB);
            subplot(1,2,2);
            res=grabcut_function(seq{i},rectangle,20);
            imshow(res);
            name=['sift-results\sift' int2str(i)];
            print(name,'-djpeg');
        end
        
    end
end
