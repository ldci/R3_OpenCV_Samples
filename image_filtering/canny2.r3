#!/usr/local/bin/r3
Rebol [
]
comment[
shape:
MORPH_RECT: 0
MORPH_CROSS: 1
MORPH_ELLIPSE: 2
]
shape: 1			;--for getStructuringElement shape
kSize: 3x3			;--Kernel Size
anchor: -1x-1		;--Center of the kernel
iter: 1				;--number of iterations

cv: import opencv
;--based on Oldes's samples
with cv [
    src: imread "../images/lena.jpg"
    namedWindow win1: "Canny"
    namedWindow win2: "Canny dilated"
    moveWindow win1 0x0
    moveWindow win2 300x0
    dst1: Canny :src none 100 200                    	;--edge detecting  r
    kernel: getStructuringElement shape kSize anchor 	;--preparing the kernel for dilatation 
    dst2: dilate :dst1 none kernel anchor iter          ;--dilating the edges
    imshow/name dst1 win1
    imshow/name dst2 win2
    waitKey 0
    destroyAllWindows
]