Implementation of the Self Similarity descriptor based on the paper:
Matching Local Self-Similarities across Images and Videos, Eli Shechtman and Michal Irani
CVPR '07

Written by: Varun Gulshan, varun@robots.ox.ac.uk

Description of files:
1. defines.h: Some definition used in mexFindSimMaps.cpp
2. mexFindSimMaps.cpp: A mex file which does the final self similarity descriptor computation. You will need to mex this before usage. So run mex -O mexFindSimMaps.cpp, and it should compile without issues (atleast it does with gcc and Visual C++)
3. ssimDescriptor.m: The outer matlab wrapper to do the descriptor computation
4. example.m: An example to show usage of the wrapper ssimDescriptor.m file

How to use ssimDescriptor.m?
Usage: [resp,drawCoords,salientCoords,uniformCoords]=ssimDescriptor(img ,parms ,allXCoords ,allYCoords)

Inputs:
img is a double image. (just do double(imread('image name'))
parms is a parameter structure described below.
allXCoords (1xN): the x coordinates where to calculate the descriptor
allYCoords (1xN): the y coordinates where to calculate the descriptor
(So the descriptors are calculated at [allYCoords(i) allXCoords(i)] , i=1 .. N)
(Note: There is a margin around the image where descriptors cannot be computed, and specifying a point outside the margin will result in a segmentation fault. The margin depends on the values in the structure parms, and is described later.)

Returns:
resp (DxN1)-> the descriptors at the passed locations (only those descriptors which were neither salient nor uniform)
drawCoords (2xN1) -> the coordinates where the descriptors were found valid and hence returned in resp (the first row is the X-coordinates, the second row is the Y-coordinates)
salientCoords (2xN2) -> the coordinates where no descriptor was calculated because it was salient (the first row is the X-coordinates, the second row is the Y-coordinates)
uniformCoords (2xN3)-> the coordinates where no descriptor was calculated because it was uniform (the first row is the X-coordinates, the second row is the Y-coordinates)

N1 = number of computed descriptors which are not salient or uniform
N2 = number of salient descriptors
N3 = number of uniform descriptors
N1+N2+N3=N

The parameter structure has the following options 
1. parms.size -> the patch size, only odd number allowed (common values are 3,5,7,9)
2. parms.coRelWindowRadius -> the correlation radius (as described in the self similarity paper) (common values are 10 , 20 , 30, 40 )
3. parms.numRadiiIntervals -> the number of intervals into which to quantize the radial bins (common values are 3,4 ,5)
4. parms.numThetaIntervals -> the number of intervals into which to quantize the angular bins (common values: 10 , 15, 20 )
5. parms.varNoise -> some parameter described in the paper for representing acceptable photometric noise. You should try to set this parameter yourself, i do not have a good value here. One tip is that you should set it to something like: parms.size^2*parms.nChannels*(estimated photometric variance in each channel). Example, for parms.size=5 (a 5x5patch), parms.nChannels=3 (a 3 channel RGB image between [0-255]), and estimated photometric variance = 36 per channel, you could set parms.varNoise = 25*3*36=2700.
6. parms.autoVarRadius -> the auto variance radius parmater described in paper. (common values 1,2,3)
7. parms.saliencyThresh -> parameter used to detect salient patches. The code marks a descriptor as salient if all bins in the descriptor are less than saliency thresh. Value of 0 disables saliency checking, value of 1 makes all patches salient (except totally homognenous patches)(values in the range [0,1])
8. parms.nChannels -> the number of channels in the image (size(img,3))

NOTE on allowed ranges for allXCoords and allYCoords:

Let radius=(parms.size-1)/2; (the radius of the patch)
margin=radius+parms.coRelWindowRadius
h and w are the height and width of the image

Then allXCoords can only lie in the closed interval [margin+1 , w-margin]
allYCoords can only lie in the closed interval [margin+1 , h-margin]

NOTE on uniformCoords and salientCoords:
The Irani paper mentions salient features and uniform features. This description was not very clear in the paper. This code contains my understanding of these salient features, and currently uniform feature detection is not implemented, though the skeleton functions which should detect this uniformity have been created in ssimDescriptor.m . You can also disable the salient feature detection by setting parms.saliencyThresh to 1.

Other notes:
This is a first implementation of this descriptor. There could be possible speeding up of this code and less memory usage, if there are such improvements, then the code on the page will be updated. 
