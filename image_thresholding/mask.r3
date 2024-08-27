#!/usr/local/bin/r3
Rebol [
]
;--from Oldes's samples
cv: import opencv
with cv [	
	img: imread %../images/mask.png
	imshow/name img "Source"
	moveWindow "Source" 0x0
	gray: cvtColor img none COLOR_BGR2GRAY
	thresh1: threshold gray none 0 255 THRESH_BINARY
	image: get-property gray     MAT_IMAGE   ;; get Rebol image
	alpha: get-property thresh1  MAT_BINARY  ;; get Rebol binary with alpha values
	image/alpha: alpha                       ;; replace image alpha with the new value
	imshow/name image "Mask"
	moveWindow "Mask" 260x0
	waitKey 0
	destroyAllWindows
	;save %masked.png image                  
]