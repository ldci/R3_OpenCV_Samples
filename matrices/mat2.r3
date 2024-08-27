#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	;--basic matrix
	mat1: Matrix 250x140 			;; creates an empty black image handle
	namedWindow win1: "From Pair"
	imshow/name mat1 win1  
	moveWindow win1 0x0 
	
	;--Float matrix
	mat2: Matrix [320x240 CV_64FC4] 	;--Float matrix
	namedWindow win2: "Float Matrix"
	imshow/name mat2 win2				
	moveWindow win2 250x0 
	;print get-property mat2 MAT_VECTOR  
	;--From image
	img: imread/image %../images/mask.png
	mat3: Matrix img
	namedWindow win3: "From Image" 
	imshow/name mat3 win3
	moveWindow win3 250x100

	;--From handle
	;img: imread/image %../../image/mask.png
	mat4: Matrix :img
	namedWindow win4: "From Handle"
	imshow/name mat4 win4
	moveWindow win4 550x0
	waitKey 0
	destroyAllWindows
]
