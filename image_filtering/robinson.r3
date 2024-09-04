#!/usr/local/bin/r3
Rebol [
]
;-- see https://docs.opencv.org/3.4/d4/dbd/tutorial_filter_2d.html 
cv: import opencv
with cv [
    src: imread "../images/mandrill.jpg"
    dst: Matrix :src
    ;--using Rebol vector for the kernel
    vec: #(f32! [
    	1.0 1.0 1.0
    	1.0 -2.0 1.0 
    	-1.0 -1.0 -1.0
        ]
    )
    ;-- create a 3x3 kernel with the vector 
    filter: Matrix [CV_32FC1 3x3 :vec]
    filter2D :src :dst -1 filter -1x-1 0.0
    ;-1 will give the output image depth as same as the input image
    ;--the location -1x-1 indicates the center by default
    ;--show result
    imshow/name src  "Source"
    imshow/name dst "Robinson"
    moveWindow "Source"  0x0
	moveWindow "Robinson" 260x0
    waitKey 0
    destroyAllWindows
]

