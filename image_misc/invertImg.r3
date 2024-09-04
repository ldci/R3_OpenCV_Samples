#!/usr/local/bin/r3
Rebol [
]
;--invert requires 32 or 64 1 channel image 
cv: import opencv
with cv [
	img: imread/with %../images/mandrill.jpg IMREAD_GRAYSCALE
	size: get-property img MAT_SIZE
	src: Matrix :img dst: Matrix :img
	convertTo :img :src CV_64F 1 / 255 0
	convertTo :img :dst CV_64F 0.0 0 
	probe get-property src MAT_TYPE
	probe get-property dst MAT_TYPE
	invert :src :dst 1
	imshow/name :src "Source"
	imshow/name :dst "Inverted"
	moveWindow "Source" 0x0
	moveWindow "Inverted" 300x0
	waitKey 0
]