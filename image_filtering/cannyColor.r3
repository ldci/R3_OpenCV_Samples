#!/usr/local/bin/r3
Rebol [
]
cv: import opencv
with cv [
    src: imread/with "../images/lena.jpg" IMREAD_COLOR
    print ["mat type    :" get-property src MAT_TYPE]
    edges: Canny :src none 80 100
    kernel: getStructuringElement MORPH_CROSS 3 -1 	;--preparing the kernel for dilatation 
    edges2: dilate :edges none kernel -1x-1 3      	;--dilating the edges
    cvtColor :edges2 :edges2 COLOR_GRAY2RGB			;--RGB color space   
    result: multiply/scale :src :edges2 none 0.003
    cvtColor :edges :edges2 COLOR_GRAY2RGB   
    add :result :edges2 :result
    imshow :result
    waitKey 0
    destroyAllWindows
]

