#!/usr/local/bin/r3
Rebol [
]
;--both images should have the same size
cv: import opencv
with cv [
	filename1: %../images/mandrill.jpg
	filename2: %../images/binaire.png
	mat1: imread/with filename1 IMREAD_COLOR
	mat2: imread/with filename2 IMREAD_COLOR
	dst: add mat1 mat2 none
	imshow/name mat1 filename1
	imshow/name mat2 filename2 
	imshow/name dst "ADD"
	moveWindow filename1 0x0
	moveWindow filename2 260x0
	moveWindow "ADD" 520x0
	waitKey 0
	destroyAllWindows 
]