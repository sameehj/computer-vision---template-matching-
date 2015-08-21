%% configurations
template = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\FedEx\template\Logo-FedEx.jpg']);
images  = dir('C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\FedEx\*.jpg');
%import images
for idx = 1:length(images)
    seq{idx} = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\FedEx\' images(idx).name]);
 %   figure;
%    imshow(seq{idx});
end
%% create the template filter 

    filters=templateFilters(rgb2gray(template));

%%
G = fspecial('gaussian',[5 5],2);
%# Filter it
for i=1:length(images)
    rectangle=applyFilters(filters,imfilter(rgb2gray(seq{i}),G,'same'),0.68);
end

%% sift images
    [templateFrames,templateDescriptors] = sift((rgb2gray(template)/255), 'Verbosity', 1);

for i = 1:size(images,1)
    [frames{i},descriptors{i}] = sift((rgb2gray(seq{i})/255), 'Verbosity', 1);
end



%% match descriptors for each pair
for i=1:length(images)
    matches{i} = (siftmatch(templateDescriptors, descriptors{i}));
   % figure;
  %  showMatches(double(template)/255,double(seq{i})/255,templateFrames,frames{i},matches{i});
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
