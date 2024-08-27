#!/usr/local/bin/r3
REBOL [
]
cv: import opencv
with cv [
	bin: to binary! #(uint8! [0 1 2 4 8 16 32 64 128])
    msk: Matrix [9x1 CV_8UC1 :bin]
    print-horizontal-line
    probe get-property msk MAT_VECTOR
    res: bitwise-not msk none
    probe get-property res MAT_VECTOR
    
    bin: to binary! #(uint16! [0 1 2 4 8 16 32 64 256])
    msk: Matrix [9x1 CV_16UC1 :bin]
    probe get-property msk MAT_VECTOR
    res: bitwise-not msk none
    probe get-property res MAT_VECTOR
    print-horizontal-line
]