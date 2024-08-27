#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
    img: imread %../images/lena.jpg
    roi: selectRoi :img           ;; returns block with 2 pairs (position and size)
    mat: Matrix [:img :roi]       ;; creates the new sub-image
    print ["Roi position and size:" roi]
    imshow mat
    waitKey 0
]