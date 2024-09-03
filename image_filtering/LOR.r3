#!/usr/local/bin/r3
Rebol [
]
;--Laplacian of Robinson Filter

grayscale?: no
knl: #(f32! [1.0 -2.0 1.0 -2.0 4.0 -2.0 1.0 -2.0 1.0])
cv: import opencv										;--use opencv extension
with cv [
	img: imread %../images/lena.jpg						;--read image as matrix
	if grayscale? [cvtColor :img :img COLOR_RGB2GRAY]	;--grayscale image
	dst1: Matrix :img									;--destination matrix 1
	filter: Matrix [CV_32FC1 3x3 :knl]					;--kernel
	filter2D :img :dst1 -1 filter 0 0					;--apply kernel
	namedWindow  src:  "Source"							;--create source window
	namedWindow  lap1: "Laplacian of Robinson Filter"	;--create destination  window
	moveWindow src 0x10									;--move source window
	moveWindow lap1 260x10								;--move destination window
	imshow/name img src									;--show source window					
	imshow/name dst1 lap1								;--show destination window
	
	
	waitKey 0											;--wait for keypress
    destroyAllWindows									;--clear all window		
]