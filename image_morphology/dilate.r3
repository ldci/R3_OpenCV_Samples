#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
kSize: 3
with cv [
    src: imread "../images/mandrill.jpg"
    namedWindow win1: "Source"
    namedWindow win2: "Dilatation"
    moveWindow win1 0x0
    moveWindow win2 260x0

    kernel: getStructuringElement MORPH_CROSS kSize -1 	;; preparing the kernel for dilatation 
    dst1: Canny src none 50 200                    		;; edge detecting
    dst2: dilate dst1 none kernel -1x-1 1				;; dilatation
    
    imshow/name src win1
    imshow/name dst2 win2
    waitKey 0
    destroyAllWindows
]