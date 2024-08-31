#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
kSize: 3
cv: import opencv
with cv [
    src: imread "../images/lena.jpg"
    namedWindow win1: "Source"
    namedWindow win2: "Erosion"
    moveWindow win1 0x0
    moveWindow win2 250x0

    kernel: getStructuringElement MORPH_CROSS kSize 1 	;; preparing the kernel for erosion 
    dst1: Canny src none 50 200                    		;; edge detecting
    dst2: erode src none kernel -1x-1 1					;; erosion
    imshow/name src win1
    imshow/name dst2 win2
    waitKey 0
    destroyAllWindows
]