#!/usr/local/bin/r3
Rebol [
]
;--see https://docs.opencv.org/4.x/d4/d76/tutorial_js_morphological_ops.html
;MORPH_RECT: 0
;MORPH_CROSS: 1
;MORPH_ELLIPSE: 2

kSize: 5
iter: 1
cv: import opencv									;--import Rebol-OpenCV extension
with cv [
    src: imread "../images/mandrill.jpg"				;--source image
    namedWindow win1: "Source"						;--create window 1
    namedWindow win2: "Erosion"						;--create window 2
    namedWindow win3: "Dilatation"					;--create window 3
    moveWindow win1 0x0								;--move window 1
    moveWindow win2 260x0							;--move window 2
    moveWindow win3 520x0							;--move window 2
    kernel1: getStructuringElement 1 kSize 1 		;--prepare the kernel for erosion 
	kernel2: getStructuringElement 1 kSize -1 		;--prepare the kernel for dilatation
    dst1: erode src none kernel1 -1x-1 iter         ;--erode the source image
    dst2: dilate src none kernel2 -1x-1 iter        ;--dilate the source image
    imshow/name src win1							;--show the source image
    imshow/name dst1 win2							;--show the eroded image
    imshow/name dst2 win3							;--show the dilated image
    waitKey 0										;--any key to close
    destroyAllWindows								;--delete all windows
]