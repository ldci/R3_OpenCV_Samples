#!/usr/local/bin/r3
REBOL [
]
cv: import opencv
with cv [
    vec1: #(uint16! [1 2 3 4 5 6])
    mat: Matrix [3x2 :vec1]  
    print-horizontal-line
    vec2: get-property mat MAT_VECTOR
    ? vec1 ? vec2
    print ["Test" pick ["OK" "failed!"] vec1 = vec2]
    bin1: to binary! vec1
    mat: Matrix [2x1 CV_16UC3 :bin1]
    bin2: get-property mat MAT_BINARY
    ? bin1 ? bin2
    print ["Test" pick ["OK" "failed!"] bin1 = bin2]
    probe get-property mat MAT_SIZE
    print-horizontal-line
    imshow/name mat "Test"
    waitkey 0
]