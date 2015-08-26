%% load configurations from configurations.m file
configurations;

%% create the template filter

filters=templateFilters(rgb2gray(template));

%%
G = fspecial('gaussian',[6 6],2);
%# Filter it
for i=1:length(images)
    rectangle=applyFilters(filters,imfilter(rgb2gray(seq{i}),G,'same'),0.68);
    for j=1:length(rectangle)
        RGB= insertShape((seq{i}),'Rectangle', rectangle{j});
        figure;
        subplot(1,2,1);
        imshow(RGB);
        subplot(1,2,2);
        res=grabcut_function(seq{i},rectangle{j},20);
        imshow(res);
    end
end

