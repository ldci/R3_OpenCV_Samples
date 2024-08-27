#!/usr/local/bin/r3
Rebol [
]
;--Oldes's sample
cv: import opencv
with cv [
    img: imread "../images/lena.jpg"
    roi: [100x100 100x100]
    mat: Matrix [:img :roi]
    imshow/name mat "Original sub-image"
    moveWindow "Original sub-image" 10x10
    ;; for testing purposes, recreate the sub-image from its resolved binary
    mtype: 	get-property mat MAT_TYPE
    bin:   	get-property mat MAT_BINARY
    img: 	Matrix [:roi/2 :mtype :bin]
    imshow/name img "Recreated image"
    moveWindow "Recreated image" 250x10
    waitKey 0
]