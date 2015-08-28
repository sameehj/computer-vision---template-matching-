# computer-vision---template-matching

=========================
GNU Global Public Licence
=========================

[![GNU GPL v3.0](http://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl.html)

View official GNU site <http://www.gnu.org/licenses/gpl.html>.

========================

#computer vision project using matlab for university course project

##two different approaches where implemented for finding template matches:

###using sift for matching the template for a given set of images
###using "brute force" approach as follows: 
2.1 creating different angles of the template image in different sizes. 
2.2 applying Gaussian filter to the set of images before the applying the convolution. 
2.3 using convolution between the the filter set and the set of images. 2.4 searching for values that are above a given threshold, those are the matches.
  
## Usage: 
set the configurations in the configurations.m file as follows: set the path to the template image and the path to the directory where other jpeg/jpg images are, those are the images that contain (or don't) the template in them. next you need to run one of two files: sift_template_matching.m or brute_force_template_matching.m.

##setting sift_template_matching.m configurations for better results:
  
###changing the RANSAC threshhold and number of iterations:
    you can do so by changing the ransac_transformation parameters.
    
##setting brute_force_template_matching.m configurations for better results:
    
###changing the convoultion result threshold:
    the convolution result is between -1 and 1. typically you want to aim to 0.6 - 0.7, but with diffrent templates those values can be reduced. you can do so by chaning the parameter to the applyFilters function.
    
 ###changing the set of filters:
    you can change the set of filters that is created from the given template by changing the inside parameters of the function temlateFilters.m. you can do so by changing the resolution of the angle or the diffrent filter size for each angle.
  
 ###chnnging the Gaussian:
  the Gaussian that is applied to the template before the convolution occurs, you can do so by changing the gaussian paramaeters in the file brute_force_template_matching.m.
