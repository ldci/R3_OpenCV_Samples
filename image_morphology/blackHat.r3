#!/usr/local/bin/r3
Rebol [
]
;--https://docs.opencv.org/3.4/d3/dbe/tutorial_opening_closing_hats.html
;--Black Hat: It is the difference between the closing and its input image 
;--(dst=blackhat(src,element)=close(src,element)−src)
cv: import opencv
with cv [
    src: imread/with "../images/lena.jpg" 1			;--source image as RGB
    namedWindow win1: "Source"
    moveWindow win1 0x0
    imshow/name src "Source"
    kernel: getStructuringElement MORPH_CROSS 11x11 -1x-1
    dst1: dilate :src none kernel -1x-1 1			;--first dilate src
	dst2: erode :dst1 none kernel -1x-1 1			;--then erode the result as closing
	blackhat: subtract :dst2 :src none				;--difference between closing and source
    namedWindow win2: "Black Hat"
    moveWindow win2 260x0
    imshow/name blackhat win2
    waitKey 0
    destroyAllWindows
]