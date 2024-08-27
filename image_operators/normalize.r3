#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
;; displaying the image in the window with file name's title
with cv [
	filename: %../images/taj.jpg
	mat: imread filename
    mat2: normalize mat none 100 255 NORM_MINMAX
	imshow/name mat filename 
	imshow/name mat2 "Normalize" 
	moveWindow filename 10x50
	moveWindow "Normalize" 320x50
	waitKey 0
	destroyAllWindows 
]




