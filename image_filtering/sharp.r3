#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
    src: imread "../images/mandrill.jpg"
    dst: Matrix :src
    ;--using Rebol vector for the kernel
    vec: #(f32! [
    	-1 -1 -1 
        -1 9 -1 
        -1 -1 -1
        ]
    )
    ;-- create the filter   
    filter: Matrix [CV_32FC1 3x3 :vec]
    filter2D :src :dst -1 filter -1x-1 0
    ;-1 will give the output image depth as same as the input image
    ;--the location -1x-1 indicates the kernel center by default
    ;--show result
    imshow/name src  "Source"
    imshow/name dst "Sharpen"
    moveWindow "Source"  0x0
	moveWindow "Sharpen" 260x0
    waitKey 0
    destroyAllWindows
]

