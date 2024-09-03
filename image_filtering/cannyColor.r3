#!/usr/local/bin/r3
Rebol [
]
comment[
shape:
MORPH_RECT: 0
MORPH_CROSS: 1
MORPH_ELLIPSE: 2
]
shape: 1			;--for getStructuringElement shape
kSize: 3x3			;--Kernel Size
anchor: -1x-1		;--Center of the kernel
iter: 3				;--number of iterations

cv: import opencv
with cv [
    src: imread/with "../images/lena.jpg" IMREAD_COLOR
    print ["mat type    :" get-property src MAT_TYPE]
    edges: Canny :src none 80 100						;--Canny filter (single channels 8-bit image)
    kernel: getStructuringElement shape kSize anchor 	;--preparing the kernel for dilatation 
    edges2: dilate :edges none kernel anchor iter      	;--dilating the edges
    cvtColor :edges2 :edges2 COLOR_GRAY2RGB				;--RGB color space   
    result: multiply/scale :src :edges2 none 0.003		;--multiply matrices 
    cvtColor :edges :edges2 COLOR_GRAY2RGB   			;--RGB color space  
    add :result :edges2 :result							;--add matrices
    imshow :result
    waitKey 0
    destroyAllWindows
]

