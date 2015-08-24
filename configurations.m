%% configurations
template = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\FedEx\template\Logo-FedEx.jpg']);
images  = dir('C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\FedEx\*.jpg');
%import images
for idx = 1:length(images)
    seq{idx} = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\Option 2 images\FedEx\' images(idx).name]);
 %   figure;
%    imshow(seq{idx});
end



