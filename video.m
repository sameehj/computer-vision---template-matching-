%%configurations
addpath(genpath('C:\Users\sam\Documents\MATLAB\final project - template matching\'))
videoFile= vision.VideoFileReader('video template matching - images and video\video.mp4');
replacement = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\video template matching - images and video\lacoste.jpg']);
template = imread(['C:\Users\sam\Documents\MATLAB\final project - template matching\video template matching - images and video\twitter.png']);
replacement=imresize(replacement,[size(template,1) size(template,2)]);
viewer = vision.DeployableVideoPlayer;
numberOfFrames=420;
N=100;

%% skip first N frames
for i=1:N
    videoFrame = step(videoFile);
end
%%create filters
[filters,angels,sizes]=templateFilters(~im2bw(template,0.3));
%% apply the transform
%G = fspecial('gaussian',[5 5],2);

%create a temp dir to store the images for the video
workingDir = 'video';
mkdir(workingDir)
mkdir(workingDir,'images')
%initalize tracker
for i=N:numberOfFrames
    %skip frames(faster editing)
    if(mod(i,5)==0)
        continue;
    end
    videoFrame = im2uint8(step(videoFile));
    %for each frame calculate find matching
    [rectangle,indexes]=applyFilters(filters,~im2bw(imresize(videoFrame,1),0.56),0.50);
    for j=1:length(rectangle)
        if(i>280)
            color='red';
        else
            color='green';
        end
        RGB= insertImage((videoFrame),replacement, rectangle{j},sizes{indexes{j}},angels(indexes{j}),color);
       % figure;
       % imshow(RGB);
    filename = [sprintf('%03d',i) '.jpg'];
    fullname = fullfile(workingDir,'images',filename);
    imwrite(RGB,fullname)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
    end


end
%%
imageNames = dir(fullfile(workingDir,'images','*.jpg'));
imageNames = {imageNames.name}';

outputVideo = VideoWriter(fullfile(workingDir,'myVideo.avi'));
outputVideo.FrameRate = 20;
open(outputVideo)

for ii = 1:length(imageNames)
    img = imread(fullfile(workingDir,'images',imageNames{ii}));
    writeVideo(outputVideo,img)
end

close(outputVideo);

