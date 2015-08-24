%% load configurations from configurations.m file
configurations;

%% self-similarity-configurations
parms.size=5;
parms.coRelWindowRadius=10;
parms.numRadiiIntervals=2;
parms.numThetaIntervals=4;
parms.varNoise=25*3*36;
parms.autoVarRadius=1;
parms.saliencyThresh=0; % I usually disable saliency checking
parms.nChannels=size(template,3);

radius=(parms.size-1)/2; % the radius of the patch
marg=radius+parms.coRelWindowRadius;

% Compute descriptor at every 5 pixels seperation in both X and Y directions
[allXCoords,allYCoords]=meshgrid([marg+1:5:size(template,2)-marg],...
                                 [marg+1:5:size(template,1)-marg]);
allXCoords=allXCoords(:)';
allYCoords=allYCoords(:)';

fprintf('Computing self similarity descriptors for the template\n');
[templateResp,templateDrawCoords,templateSalientCoords,templateUniformCoords]=ssimDescriptor(double(template) ,parms ,allXCoords ,allYCoords);
%%
fprintf('Computing self similarity descriptors for the rest of images\n');
for i=1:length(images)
    parms.nChannels=size(seq{i},3);

radius=(parms.size-1)/2; % the radius of the patch
marg=radius+parms.coRelWindowRadius;

% Compute descriptor at every 5 pixels seperation in both X and Y directions
[allXCoords,allYCoords]=meshgrid([marg+1:5:size(seq{i},2)-marg],...
                                 [marg+1:5:size(seq{i},1)-marg]);
allXCoords=allXCoords(:)';
allYCoords=allYCoords(:)';
    
    [resp{i},drawCoords{i},salientCoords{i},uniformCoords{i}]=ssimDescriptor(double(seq{i}) ,parms ,allXCoords ,allYCoords);
end

%% match descriptors 
fprintf('matching descriptors\n');
for i=1:length(images)
    indexPairs{i}=matchFeatures(templateResp',resp{i}','MatchThreshold',1);
end
%%