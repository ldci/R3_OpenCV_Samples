#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	alpha: 1.0										;--scale factor
	beta: 64										;--delta added to the scaled values
	filename: %../images/mandrill.jpg					;--file name
	img: imread/with filename IMREAD_UNCHANGED		;--load image as is
	mat1: convertTo img none CV_8U alpha beta		;--increase the brightness by 64 
	mat2: convertTo img none CV_8U alpha negate beta;--decrease the brightness by 64 
	imshow/name img  "Source"						;--show image 
	imshow/name mat1 "High Brightness"				;--show image
	imshow/name mat2 "Low Brightness"				;--show image
	moveWindow "Source"  260x0						;--move image 			
	moveWindow "High Brightness" 520x0				;--move image
	moveWindow "Low Brightness" 0x0					;--move image
	waitKey 0										;--any key to close
]
