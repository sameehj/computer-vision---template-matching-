%% load configurations from configurations.m file
configurations;

%% create the template filter
template=imresize(template,0.3);
filters=templateFilters(rgb2gray(template));

%%
G = fspecial('gaussian',[6 6],2);
index=1;
%# Filter it
for i=2:length(images)
    rectangle=applyFilters(filters,imfilter(rgb2gray(imresize(seq{i},0.4)),G,'same'),0.35);
    for j=1:length(rectangle)
        RGB= insertShape((seq{i}),'Rectangle', rectangle{j});
        figure;
        subplot(1,2,1);
        imshow(RGB);
        subplot(1,2,2);
        res=grabcut_function(seq{i},rectangle{j},20);
        imshow(res);
        name=['brute-force-results\bf' int2str(index)];
        index=index+1;
        print(name,'-djpeg');
    end
end

