#!/usr/local/bin/r3
Rebol [
]
;--Oldes's sample
cv: import opencv
with cv [
	img: imread %../images/taj.jpg					;--read image as matrix
	filtered: bilateralFilter :img none 15 40.0 40.0;--apply bilateral filter
	namedWindow  src: "Source"						;--create source window
	namedWindow  dst: "Filtered"					;--create destination window
	moveWindow src 100x100							;--move source window
	moveWindow dst 420x100							;--move destination window
	imshow/name img src								;--show source window
	imshow/name filtered dst						;--show destination window
	waitKey 0										;--wait for a key
    destroyAllWindows								;--close all windows
]
