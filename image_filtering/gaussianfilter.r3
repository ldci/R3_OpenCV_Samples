#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
	img: imread %../images/mandrill.jpg	;--read image as matrix
    dst1:  Matrix img					;--make a new matrix
    dst2:  Matrix img					;--make a new matrix
    dst3:  Matrix img					;--make a new matrix
	namedWindow  src: "Source"			;--create source window
	namedWindow  gau1: "Gaussian 25x25"	;--create destination window
	namedWindow  gau2: "Gaussian 1x25"	;--create destination window
	namedWindow  gau3: "Gaussian 25x1"	;--create destination window
	moveWindow src 10x10				;--move source window
	moveWindow gau1 270x10				;--move destination window
	moveWindow gau2 10x300				;--move destination window
	moveWindow gau3 270x300				;--move destination window
	;--Kernel Size > 0x0 and odd
	gaussianBlur :img :dst1 25x25 0 0	;--apply Gaussian xy filter
	gaussianBlur :img :dst2 1x25  0 0	;--apply Gaussian y filter 
	gaussianBlur :img :dst3 25x1  0 0	;--apply Gaussian x filter
	imshow/name img src					;--show source window
	imshow/name dst1 gau1				;--show destination window
	imshow/name dst2 gau2				;--show destination window
	imshow/name dst3 gau3				;--show destination window
	waitKey 0							;--wait for keypress key
    destroyAllWindows					;--close all windows
]

;{ksize.width > 0 && ksize.width % 2 == 1 && ksize.height > 0 && ksize.height % 2 == 1}