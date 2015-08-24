%% load configurations from configurations.m file
configurations;

%% create the template filter 

    filters=templateFilters(rgb2gray(template));

%%
G = fspecial('gaussian',[5 5],2);
%# Filter it
for i=1:length(images)
    rectangle=applyFilters(filters,imfilter(rgb2gray(seq{i}),G,'same'),0.68);
end

