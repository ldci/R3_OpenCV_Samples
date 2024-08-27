#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
;--based on Oldes's samples
with cv [
    src: imread "../images/lena.jpg"
    namedWindow win1: "Canny"
    namedWindow win2: "Canny dilated"
    moveWindow win1 0x0
    moveWindow win2 250x0
    kernel: getStructuringElement MORPH_CROSS 3 -1 	;--preparing the kernel for dilatation 
    dst1: Canny src none 100 200                    ;--edge detecting
    dst2: dilate dst1 none kernel -1x-1 1          	;--dilating the edges
    imshow/name dst1 win1
    imshow/name dst2 win2
    waitKey 0
    destroyAllWindows
]