#!/usr/local/bin/r3
Rebol [
]
;--Oldes's code
;Known issue is, that one should not mix binary and vector data! 
;Vector info is encoded in the series' size:/
cv: import opencv
with cv [
    ;; allocate vector for a grayscale image of size 320x200
    data: #(uint8! 64000)
    ;; make an OpenCV metrix using the shared data
    img: Matrix [320x200 :data]
    ;; do some animation...
    forever [
        ;; manipulate the matrix data using Rebol code with the direct access
        forall data [data/1: random 255]
        ;; display the image using OpenCV
        imshow img
        if 0 < waitKey 10 [break]
    ]
]