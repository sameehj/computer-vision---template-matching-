%% configurations
addpath(genpath('C:\Users\sam\Documents\MATLAB\final project - template matching\'))

template = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\starbucks\template\template.jpg']);
images  = dir('C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\starbucks\*.jpg');
%import images
for idx = 1:length(images)
    seq{idx} = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\starbucks\' images(idx).name]);
 %   figure;
%    imshow(seq{idx});
end



