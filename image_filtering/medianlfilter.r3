#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
with cv [
	img: imread %../images/taj.jpg		;--read image as matrix
	filtered: medianBlur :img none 5	;--apply median filter
	namedWindow  src: "Source"			;--create source window
	namedWindow  dst: "Filtered"		;--create destination window
	moveWindow src 100x100				;--move source window
	moveWindow dst 420x100				;--move destination windos
	imshow/name img src					;--show source window
	imshow/name filtered dst			;--show destination window
	waitKey 0							;--any key to close
    destroyAllWindows					;--close all windows
]
