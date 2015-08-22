# computer-vision---template-matching-
computer vision project based on matlab for university course project

two diffrent approaches where implemented for finding template matches:

  1. using sift for mathing the template for a given set of images
  2. using "brute force" approach as follows:
    2.1 creating diffrent angles of the template image in diffrent sizes.
    2.2 applying gaussian filter to the set of images before the applying the convolution. 
    2.3 using convolution between the the filter set and the set of images.
    2.4 searching for values that are above a given threshhold, those are the matches.
  
