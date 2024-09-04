#!/usr/local/bin/r3
Rebol [
]
;-- Laplacian of Gaussian filter
grayscale?: no
knl1: #(f32! [0.0 -1.0 0.0 -1.0 4.0 -1.0 0.0 -1.0 0.0])
knl2: #(f32! [0.0 0.0 -1.0 0.0 0.0
		  0.0 -1.0 -2.0 -1.0 0.0
		  -1.0 -2.0 16.0 -2.0 -1.0
		  0.0 -1.0 -2.0 -1.0 0.0
		  0.0 0.0 -1.0 0.0 0.0]
)

cv: import opencv										;--use opencv extension
with cv [
	img: imread %../images/mandrill.jpg						;--read image as matrix
	if grayscale? [cvtColor :img :img COLOR_RGB2GRAY]	;--grayscale image
	dst1: Matrix :img									;--destination matrix 1
	dst2: Matrix :img									;--destination matrix 2
	filter1: Matrix [CV_32FC1 3x3 :knl1]				;--first kernel
	filter2D :img :dst1 -1 filter1 0 0					;--apply first kernel
	filter2: Matrix [CV_32FC1 5x5 :knl2]				;--second kernel
	filter2D :img :dst2 -1 filter2 0 0					;--apply second kernel
	namedWindow  src:  "Source"							;--create source window
	namedWindow  lap1: "LoG 3x3"						;--create destination 1 window
	namedWindow  lap2: "LoG 5x5"						;--create destination 2 window
	moveWindow src 0x10									;--move source window
	moveWindow lap1 260x10								;--move destination 1 window
	moveWindow lap2 520x10								;--move destination 2 window
	imshow/name img src									;--show source window					
	imshow/name dst1 lap1								;--show destination 1 window
	imshow/name dst2 lap2								;--show destination 2 window
	waitKey 0											;--wait for keypress
    destroyAllWindows									;--clear all window		
]
