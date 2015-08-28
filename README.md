# computer-vision---template-matching

=========================
GNU Global Public Licence
=========================

[![GNU GPL v3.0](http://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl.html)

View official GNU site <http://www.gnu.org/licenses/gpl.html>.

========================

computer vision project based on matlab for university course project

two diffrent approaches where implemented for finding template matches:

  1. using sift for mathing the template for a given set of images
  2. using "brute force" approach as follows:
    2.1 creating diffrent angles of the template image in diffrent sizes.
    2.2 applying gaussian filter to the set of images before the applying the convolution. 
    2.3 using convolution between the the filter set and the set of images.
    2.4 searching for values that are above a given threshhold, those are the matches.
  
  Usage:
    make the configurations in the configurations.m file as follows: set the path to the template image and the path to the directory where other jpeg/jpg images are, those are the images that contain (or don't) the template in them. next you need to run one of two files: sift_template_matching.m or brute_force_template_matching.m.
