#!/usr/local/bin/r3
REBOL [ 
] 

cv: import opencv
do load %GaborLib.r3

;--main program
;--usage r3 gabor.r3 angle f sigmax sigmay radius
;--sample: r3 consoleGabor1.r3 90 0.1 7.0 7.0 20
;--get script arguments
arg: system/script/args
angle: 		to integer! arg/1
f:  		to decimal! arg/2	; 0.1
theta: 		to-radians angle	; 90.0 
sigma_x: 	to decimal! arg/3 	;7.0
sigma_y: 	to decimal! arg/4 	;7.0
radius: 	to integer! arg/5 	;20

print "Generating Filter"
blk: rcvGaborKernel theta f sigma_x sigma_y radius
probe blk 
msize: as-pair blk/1 blk/1
mini: blk/2
maxi: blk/3
data: make vector! reduce ['uint8! blk/1 * blk/1]

;--Normalization from 0 to 255 with mini and maxi
n: length?  blk/4 
repeat i n [data/:i: to-integer ((blk/4/:i - mini) * 255) / (maxi - mini)]

print "Creating Images"
;--OpenCV module for displaying image
with cv [
	;--grayscale and heatmap matrices 
	m1: Matrix [:msize CV_8UC1 :data]
	m2: Matrix [:msize CV_8UC3]
	applyColorMap :m1 :m2 COLORMAP_INFERNO
	imshow/name resize/with m1 500%  INTER_NEAREST_EXACT "Grayscale"
	imshow/name resize/with m2 500% INTER_NEAREST_EXACT "Heatmap"
	moveWindow "Heatmap" 0x200
	print "Any key to close"
	waitKey 0
]




    