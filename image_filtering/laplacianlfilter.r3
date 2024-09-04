#!/usr/local/bin/r3
Rebol [
]

;-- see: https://docs.opencv.org/3.4/d5/db5/tutorial_laplace_operator.html
 
kSize: 3
scale: 1
delta: 0

cv: import opencv
with cv [
	ddepth: CV_16S
	img: imread %../images/mandrill.jpg					;--read image as matrix
	gray: Matrix img								;--make grayscale matrix
    dst:  Matrix img								;--make destination matrix
	namedWindow  src: "Source"						;--create source window
	namedWindow  lap: "Laplacian"					;--create destination window
	moveWindow src 0x10								;--move source window
	moveWindow lap 260x10							;--move destination window
	GaussianBlur img img 3x3 0 0					;--reduce noise with a Gaussian filter
	cvtColor :img :gray COLOR_BGR2GRAY				;--make a grayscale matrix			
	Laplacian :gray :dst ddepth kSize scale delta	;--Laplacian filter
	convertScaleAbs :dst :dst 1 0					;--we need a 8-bit image
	imshow/name img src								;--show source window					
	imshow/name dst lap								;--show destination window
	waitKey 0										;--wait for keypress
    destroyAllWindows								;--clear all window		
]
