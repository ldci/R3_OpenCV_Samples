#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
    src: imread "../images/lena.jpg"
    ;cvtColor src src COLOR_BGR2GRAY
    dst: Matrix :src
    mx1: Matrix :src
    mx2: Matrix :src 
    ;--using Rebol vector for the kernel
    h1: #(f32! [0.0 1.0 -1.0 0.0])
	h2: #(f32! [1.0 0.0 0.0 -1.0])
    ;-- create the filter   
    filter1: Matrix [CV_32FC1 2x2 :h1]
    filter2: Matrix [CV_32FC1 2x2 :h2]
    
    ;-1 will give the output image depth as same as the input image
    ;--the location -1x-1 indicates the kernel center by default
    filter2D :src :mx1 -1 filter1 -1x-1 1
    filter2D :src :mx2 -1 filter2 -1x-1 1
    add mx1 mx2 dst 
    
    ;--show result
    imshow/name src  "Source"
    imshow/name dst "Robert's Filter"
    moveWindow "Source"  0x0
	moveWindow "Robert's Filter" 260x0
    waitKey 0
    destroyAllWindows
]