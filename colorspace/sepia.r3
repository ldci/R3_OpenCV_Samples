#!/usr/local/bin/r3
Rebol [
]
;--based on Oldes's sample
cv: import opencv
with cv [
    src: imread "../images/lena.jpg"
    ; using a binary for the kernel, but it should be possible
    ; to use vector directly later once implemented!
    ; see sepia2.r
    
    bin: to binary! #(f32! [
    	0.272 0.534 0.131
        0.349 0.686 0.168
        0.393 0.769 0.189        
    ])
    probe get-property src MAT_SIZE
    sepia-filter: Matrix [CV_32FC1 3x3 :bin]
    transform src src sepia-filter
    imshow src
    waitKey 0
    destroyAllWindows
]

