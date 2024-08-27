#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample

cv: import opencv
with cv [
    src: imread "../images/trees.jpg"
    ;--using Rebol vector for the kernel
    ;--a 32-bit float vector with 9 values (3x3) 
    vec: #(f32! [
    	0.272 0.534 0.131
        0.349 0.686 0.168
        0.393 0.769 0.189
        ]
    )
    ;print average vec
    ;-- create the filter   
    sepia-filter: Matrix [CV_32FC1 3x3 :vec]
    ;--apply filter to each pixel
    transform :src :src :sepia-filter
    ;--show result
    imshow src
    waitKey 0
    destroyAllWindows
]

