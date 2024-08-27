#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
with cv [
    src: imread "../images/trees.jpg"
    ; using a binary for the kernel, but it should be possible
    ; to use vector directly later once implemented!
    
    bin: to binary! #(f32! [
    	0.0 0.0 0.0 
    	0.0 1.0 0.0 
    	1.0 0.0 1.0
    	]
    )
    filter: Matrix [CV_32FC1 3x3 :bin]
    transform :src :src :filter
    imshow src
    waitKey 0
    destroyAllWindows
]

;write %res2.jpg cv/get-property src cv/MAT_IMAGE 