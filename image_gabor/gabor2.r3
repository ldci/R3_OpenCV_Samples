#!/usr/local/bin/r3
REBOL [ 
] 

cv: import opencv
do load %GaborLib.r3

;--main program
angle: 		90
f:  		0.1
theta: 		to-radians angle	; 90.0 
sigma_x: 	7.0
sigma_y: 	7.0
radius: 	20

print "Generating Filter"
blk: 	 	rcvGaborKernel theta f sigma_x sigma_y radius
msize: 		as-pair blk/1 blk/1
kvalues: 	make vector! reduce ['f64! blk/1 * blk/1 blk/4]

print "Creating Images"
;--OpenCV module for displaying image
with cv [
	m0: Matrix [:msize CV_64FC1 :kvalues]	;--kernel values are Float 64 values
	;--grayscale and heatmap matrices 
	m1: Matrix [:msize CV_8UC1]
	m2: Matrix [:msize CV_8UC3]
	normalize :m0 :m1 0 255 NORM_MINMAX		;--normalise to 0..255 values
	applyColorMap :m1 :m2 COLORMAP_INFERNO	;--colormap
	imshow/name resize/with m1 800% INTER_NEAREST_EXACT "Grayscale"
	imshow/name resize/with m2 800% INTER_NEAREST_EXACT "Heatmap"
	moveWindow "Heatmap" 0x300
	print "Any key to close"
	waitKey 0
]




    