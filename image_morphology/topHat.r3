#!/usr/local/bin/r3
Rebol [
]
;--https://docs.opencv.org/3.4/d3/dbe/tutorial_opening_closing_hats.html
;--Top Hat: It is the difference between an input image and its opening.
;--(dst=tophat(src,element)=src−open(src,element))

cv: import opencv
with cv [
    src: imread/with "../images/lena.jpg" 1			;--source image as RGB image
    namedWindow win1: "Source"
    moveWindow win1 0x0
    imshow/name src "Source"
    kernel: getStructuringElement MORPH_CROSS 9x9 -1x-1
    dst1: erode :src none kernel -1x-1 1			;--erode source image
	dst2: dilate :dst1 none kernel -1x-1 1			;--dilate result as opening
	tophat: subtract src dst2 none
    namedWindow win2: "Top Hat"
    moveWindow win2 260x0
    imshow/name tophat win2
    waitKey 0
    destroyAllWindows
]