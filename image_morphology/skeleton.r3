#!/usr/local/bin/r3
Rebol [
]

;--all images are binary with 1 channel
;--using erode and dilate is similar to morphologyEx (not supported by Rebol 3)

cv: import opencv
with cv [
    img: imread/with "../images/char.png" IMREAD_GRAYSCALE 			;--source image as GS
    threshold :img :img 127 255 THRESH_BINARY 
    namedWindow win1: "Source"
    moveWindow win1 0x0
    imshow/name img "Source"
    skel: Matrix [:img/size CV_8UC1] 	
    element: getStructuringElement MORPH_CROSS 3x3 -1x-1
    until [
    	eroded: erode :img none element -1x-1 1
    	temp: dilate :eroded none element -1x-1 1
    	subtract :img :temp :temp
    	bitwise-or :skel :temp :skel
    	img: :eroded
   		maxi: second minMaxLoc img
   		maxi = 0
   	]
    namedWindow win2: "Skeleton"
    moveWindow win2 250x0
    imshow/name skel win2
    waitKey 0
    destroyAllWindows
]