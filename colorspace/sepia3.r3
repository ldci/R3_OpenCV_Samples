#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample

cv: import opencv
with cv [
    src: imread "../images/trees.jpg"
    ;--using Rebol vector for the kernel
    vec: #(f32! [
    	0.1 0.9 0.0 
        0.3 0.0 0.7 
        0.1 0.1 0.8
        ]
    )
    ;-- create the filter   
    sepia-filter: Matrix [CV_32FC1 3x3 :vec]
    ;--apply filter to each pixel
    transform :src :src :sepia-filter
    ;--show result
    imshow src
    waitKey 0
    destroyAllWindows
]

