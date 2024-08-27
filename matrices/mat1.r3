#!/usr/local/bin/r3
REBOL [
]
cv: import opencv
with cv [
    img: imread/image %../images/mask.png ;--read as Rebol image
    print-horizontal-line
    print ["|Image Size:" img/size] 
    imshow/name img "Source" 
    mat: resize img 200%
    print ["|mat size    :" get-property mat MAT_SIZE]
    print ["|mat type    :" get-property mat MAT_TYPE]
    print ["|mat depth   :" get-property mat MAT_DEPTH]
    print ["|mat channels:" get-property mat MAT_CHANNELS]
    print-horizontal-line
    imshow/name mat "Resize" 
    moveWindow "Resize" 250x10
    waitkey 0
    destroyAllWindows 
]