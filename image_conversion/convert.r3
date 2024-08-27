#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	filename: %../images/lena.jpg
	img: imread/with filename IMREAD_UNCHANGED
	mat1: convertTo img none CV_16U 255 0
	mat2: convertTo img none CV_32F 1 / 255 0
	print ["img type     :"  get-property img MAT_TYPE]
	print ["mat1 type    :"  get-property mat1 MAT_TYPE]
	print ["mat2 type    :"  get-property mat2 MAT_TYPE]
	imshow/name img  "8-bit" 
	imshow/name mat1 "16-bit"
	imshow/name mat2 "32-bit"
	moveWindow "8-bit"  0x0
	moveWindow "16-bit" 260x0
	moveWindow "32-bit" 520x0
	waitKey 0
	destroyAllWindows 
]

