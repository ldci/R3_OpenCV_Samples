#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	filename: %../images/mandrill.jpg
	img: imread/with filename IMREAD_UNCHANGED
	mat1: convertTo img none CV_8U 2 0		;increase the contrast (double)
	mat2: convertTo img none CV_8U 0.5 0	;decrease the contrast (half)
	imshow/name img  "Source" 
	imshow/name mat1 "High Contrast"
	imshow/name mat2 "Low Contrast"
	moveWindow "Source"  260x0
	moveWindow "High Contrast" 520x0
	moveWindow "Low Contrast" 0x0
	waitKey 0
]