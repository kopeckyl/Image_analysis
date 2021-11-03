# Image_analysis
Bulk Image analysis for plant damage using ImageJ

## Introduction

This analysis was mainly made to quantify plant area based on green area for accessing herbicide damage. For this bulk analysis to work, you will need to take photos using a tripod and keep your target at a constant distance from the camera. Having a dark and uniform background is paramount, it will make your analysis error smaller. I also recommend taking multiple angle photos is there is a large 3D variation in the plant architecture. Make sure to have at least one photo with a ruler for scale. This analysis will accept both tiff and jpeg files.

**if you use this approach please cite:** Bobadilla, Lucas K., et al. "Frequency, distribution, and ploidy diversity of herbicide-resistant Italian ryegrass (Lolium perenne spp. multiflorum) populations of western Oregon." Weed Science 69.2 (2021): 177-185. 

## Imagej/Fiji installation

This pipeline is all made in ImageJ using a macro.

ImageJ installation: https://fiji.sc


## Analysis steps

1. Set a global scale

* With imageJ, open the image containing your scale. 
* Click on "Straight line segment" and place a line over your scale. 
* Click on "Analyze" tab > "set_scale"
* Write your known distance and unit and make sure to set it as global scale.

2. Choose your color space

* Open one of your images
* Click on "Image" > "Adjust" > "Colour threshold"
* Select the Lab colour space and IsoData as Thresholding method
* Start with L: 65-255; a: 0-140; b: 135-255
* Adjust the colour intervals until you have only the plant target selected
* Click select > "Analyze" > "Analyze particles.."
* Chose a minimum size to capture your image (e.g if you have a scale of 17mm I would choose 4mm)
* Mark "summarize" and click ok
* Check if your count is only 1 or if correspond to the number of targets in the image
* If yes, take notes of your Lab colour selection. If not repeat the process.
* If your images are uniform regarding background, you should be fine to run the script if not, repeat the steps in at least 3 other images.

3. Run the script

* Open the script macro on imageJ (double click it or go to plugins > macro > edit..)
* Change the colour space by the values from step 2 on lines 24-31
* Save it
* Place all images to be analyzed into a folder
* run script
* Select image folder
* Save csv
* Optional: run R script to clean your analysis if you want to get an average from multiple angle images

