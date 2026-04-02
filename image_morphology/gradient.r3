#!/usr/local/bin/r3
Rebol [
]
;https://docs.opencv.org/3.4/d3/dbe/tutorial_opening_closing_hats.html
;Morphological Gradient: It is the difference between the dilation and the erosion of an image.
;(dst=morphgrad(src,element)=dilate(src,element)−erode(src,element) )


cv: import opencv
with cv [
	src: imread/with "../images/lena.jpg" 1			;--as a RGB matrix
    namedWindow win1: "Source"
    moveWindow win1 0x0
    imshow/name src win1
    kernel: getStructuringElement 1 3x3 -1x-1		;--MORPH_CROSS
    dst1: dilate src none kernel -1x-1 1           	;--dilate the source image
    dst2: erode src none kernel -1x-1 1            	;--erode the source image
    gradient: subtract dst1 dst2 none				;--dilate - erode
    namedWindow win2: "Gradient"
    moveWindow win2 260x0
    imshow/name gradient win2
    waitKey 0
    destroyAllWindows
]