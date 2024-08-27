#!/usr/local/bin/r3
Rebol [
]
;--https://en.wikipedia.org/wiki/Kuwahara_filter
cv: import opencv
with cv [
    src: imread/with "../images/lena.jpg" -1; IMREAD_UNCHANGED
    dst: Matrix :src
    ;--using Rebol vector type for the kernel
    vec: #(f32! [-0.5 1.5 -0.5
		 1.5 -3.0 1.5
		-0.5 1.5 -0.5]
	)
    ;-- create the filter   
    filter: Matrix [CV_32FC1 3x3 :vec]
    filter2D :src :dst -1 :filter 0 0
    ;-1 will give the output image depth as same as the input image
    
    ;--show result
    imshow/name src  "Source"
    imshow/name dst "Kuwahara"
    moveWindow "Source"  0x0
	moveWindow "Kuwahara" 260x0
    waitKey 0
    destroyAllWindows
]

